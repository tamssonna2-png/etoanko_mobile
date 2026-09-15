import 'dart:math';

import 'package:drift/drift.dart';
import 'package:etoankopay/data/constantes/constante.dart';
import 'package:etoankopay/data/database/app_database.dart';
import 'package:etoankopay/domain/transaction_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../transaction_repository.dart';


final transactionRepositoryProvider = Provider<TransactionRepository>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return SqliteTransactionRepositoryImpl(db);
});

class SqliteTransactionRepositoryImpl implements TransactionRepository {
  final AppDatabase db;
  

  SqliteTransactionRepositoryImpl(this.db);
  final fraisTransfert = Constante.fraisTransfert;
  final fraisRetrait = Constante.fraisRetrait;

  /*@override
  Future<bool> executerRecharge({required String utilisateurTelephone, required double montant, required OperatorType operateur}) async => false;

  @override
  Future<bool> executerRetrait({required String utilisateurTelephone, required double montant, required OperatorType operateur}) async => false;

  @override
  Future<bool> executerTransfert({required String utilisateurTelephone, required double montant, required OperatorType operateur, required String destinataire}) async => false;*/

































































  @override
  Future<bool> executerRecharge({
    required String utilisateurTelephone,
    required double montant,
    required OperatorType operateur,
  }) async {
    if(montant <=0){
      throw Exception("Entrez un montant positif");
    }
    final user = await getUtilisateur(utilisateurTelephone);
    if (user == null) throw Exception("Utilisateur introuvable");

    // 1. Créditer le solde dans la BDD
    await updateSolde(utilisateurTelephone, user.solde + montant);

    // 2. Insérer l'historique de transaction
    await db.into(db.transactionTable).insert(
      TransactionTableCompanion.insert(
        id: 'tx-${Random().nextInt(9999)}',
        reference: 'ETK-RC-${Random().nextInt(89999) + 10000}',
        utilisateurTelephone: utilisateurTelephone,
        type: TransactionType.RECHARGE.name,
        montant: montant,
        frais: 0.0,
        operateurDest: operateur.name,
        date: DateTime.now(),
        statut: TransactionStatus.SUCCESS.name,
      ),
    );
    return true;
  }








   @override
  Future<bool> executerRetrait({
    required String utilisateurTelephone,
    required double montant,
    required OperatorType operateur,
  }) async {
    if(montant <=0){
      throw Exception("Entrez un montant positif");
    }
    final user = await getUtilisateur(utilisateurTelephone);
    if (user == null) throw Exception("Utilisateur introuvable");

    final double frais = montant * fraisRetrait; // 10% de frais
    final double totalDebiter = montant + frais;

    // 1. VÉRIFICATION DU SOLDE
    if (user.solde < totalDebiter) {
      throw Exception("Solde insuffisant pour effectuer ce retrait");
    }

    // 2. Débiter le solde dans SQLite
    await updateSolde(utilisateurTelephone, user.solde - totalDebiter);

    // 3. Enregistrer la transaction
    await db.into(db.transactionTable).insert(
      TransactionTableCompanion.insert(
        id: 'tx-${Random().nextInt(9999)}',
        reference: 'ETK-RT-${Random().nextInt(89999) + 10000}',
        utilisateurTelephone: utilisateurTelephone,
        type: TransactionType.RETRAIT.name,
        montant: montant,
        frais: frais,
        operateurDest: operateur.name,
        date: DateTime.now(),
        statut: TransactionStatus.SUCCESS.name,
      ),
    );
    return true;
  }




   @override
  Future<bool> executerTransfert({
    required String utilisateurTelephone,
    required double montant,
    required OperatorType operateur,
    required String destinataire,
  }) async {
    final expediteur = await getUtilisateur(utilisateurTelephone);
    
    if (expediteur == null) throw Exception("Expéditeur introuvable");
    if(montant <=0){
      throw Exception("Entrez un montant positif");
    }
    final double frais = montant * fraisTransfert; 
    final double totalDebiter = montant + frais;

    // 1. VÉRIFICATION DU SOLDE
    if (expediteur.solde < totalDebiter) {
      throw Exception("Solde insuffisant pour effectuer ce transfert");
    }
    final destUser  = await getUtilisateur(destinataire);

  if(destUser ==null){
    throw Exception("le compte destinataire n'existe pas");
  }
    // 2. Débiter l'expéditeur
    await updateSolde(utilisateurTelephone, expediteur.solde - totalDebiter);

    // 3. Créditer le destinataire (s'il existe dans l'application)
    await updateSolde(destinataire, destUser.solde + montant);

    // 4. Enregistrer la transaction
    await db.into(db.transactionTable).insert(
      TransactionTableCompanion.insert(
        id: 'tx-${Random().nextInt(9999)}',
        reference: 'ETK-TR-${Random().nextInt(89999) + 10000}',
        utilisateurTelephone: utilisateurTelephone,
        type: TransactionType.TRANSFERT.name,
        montant: montant,
        frais: frais,
        operateurDest: operateur.name,
        numeroDestinataire: Value(destinataire),
        date: DateTime.now(),
        statut: TransactionStatus.SUCCESS.name,
      ),
    );
    return true;
  }















































  // --- CONVERTISSEUR (Drift Data Class -> TransactionModel) ---
  TransactionModel toDomain(TransactionTableData row) {
    return TransactionModel(
      id: row.id,
      reference: row.reference,
      utilisateurTelephone: row.utilisateurTelephone,
      type: TransactionType.values.byName(row.type),
      montant: row.montant,
      frais: row.frais,
      operateurDest: OperatorType.values.byName(row.operateurDest),
      numeroDestinataire: row.numeroDestinataire,
      date: row.date,
      statut: TransactionStatus.values.byName(row.statut),
    );
  }

  // --- HELPER : Récupérer un utilisateur Drift par téléphone ---
  Future<UtilisateurTableData?> getUtilisateur(String telephone) async {
    final query = db.select(db.utilisateurTable)
      ..where((u) => u.telephone.equals(telephone));
    return await query.getSingleOrNull();
  }

  // --- HELPER : Mettre à jour le solde d'un utilisateur ---
  Future<void> updateSolde(String telephone, double nouveauSolde) async {
    await (db.update(db.utilisateurTable)
          ..where((u) => u.telephone.equals(telephone)))
        .write(UtilisateurTableCompanion(solde: Value(nouveauSolde)));
  }

  @override
  Future<List<TransactionModel>> getTransactions() async {
    final rows = await db.select(db.transactionTable).get();
    return rows.map(toDomain).toList();
  }

  @override
  Future<List<TransactionModel>> getTransactionsParUtilisateur(String telephone) async {
    final query = db.select(db.transactionTable)
      ..where((t) => t.utilisateurTelephone.equals(telephone) | t.numeroDestinataire.equals(telephone));
    
    final rows = await query.get();
    return rows.map(toDomain).toList();
  }


// juste pour un test

  
  Future<void> afficherLogsBaseDeDonnees() async {
    print('================ DEBUG BDD - UTILISATEURS ================');
    final utilisateurs = await db.select(db.utilisateurTable).get();
    if (utilisateurs.isEmpty) {
      print('Aucun utilisateur trouvé dans la table.');
    } else {
      for (var u in utilisateurs) {
        print('Utilisateur -> Tél: ${u.telephone} | Nom: ${u.nom} | Solde: ${u.solde} XAF');
      }
    }

    print('================ DEBUG BDD - TRANSACTIONS ================');
    final transactions = await db.select(db.transactionTable).get();
    if (transactions.isEmpty) {
      print('Aucune transaction trouvée dans la table.');
    } else {
      for (var t in transactions) {
        print('Transaction -> Ref: ${t.reference} | Type: ${t.type} | Montant: ${t.montant} XAF | Frais: ${t.frais} XAF | Date: ${t.date}');
      }
    }
    print('===========================================================');
  }
  Future<void> reinitialiserSoldeBDD(String telephone) async {
  await (db.update(db.utilisateurTable)
        ..where((u) => u.telephone.equals(telephone)))
      .write(const UtilisateurTableCompanion(solde: Value(0.0)));
}


}
