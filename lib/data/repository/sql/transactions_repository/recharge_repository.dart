/*import 'dart:math';

import 'package:etoankopay/data/database/app_database.dart';
import 'package:etoankopay/data/repository/sql/sqlite_transaction_repository_impl.dart';
import 'package:etoankopay/domain/transaction_model.dart';

class RechargeRepository extends SqliteTransactionRepositoryImpl {
  RechargeRepository(super.db);


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
}*/