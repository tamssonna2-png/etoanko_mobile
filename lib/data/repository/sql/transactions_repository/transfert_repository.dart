/*import 'dart:math';

import 'package:drift/drift.dart';
import 'package:etoankopay/data/database/app_database.dart';
import 'package:etoankopay/data/repository/sql/sqlite_transaction_repository_impl.dart';
import 'package:etoankopay/domain/transaction_model.dart';

class TransfertRepository extends SqliteTransactionRepositoryImpl{
  TransfertRepository(super.db);

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
}
*/