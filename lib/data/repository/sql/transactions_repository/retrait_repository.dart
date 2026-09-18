/*import 'dart:math';

import 'package:etoankopay/data/database/app_database.dart';
import 'package:etoankopay/data/repository/sql/sqlite_transaction_repository_impl.dart';
import 'package:etoankopay/domain/transaction_model.dart';

class RetraitRepository extends SqliteTransactionRepositoryImpl{
  RetraitRepository(super.db);

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
}*/
