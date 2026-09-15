
import 'package:etoankopay/domain/transaction_model.dart';

abstract class TransactionRepository {
    
  Future<List<TransactionModel>> getTransactionsParUtilisateur(String telephone);

  Future<List<TransactionModel>> getTransactions();

  Future<bool> executerRetrait({
    required String utilisateurTelephone,
    required double montant,
    required OperatorType operateur,
  });

  Future<bool> executerTransfert({
    required String utilisateurTelephone,
    required double montant,
    required OperatorType operateur,
    required String destinataire,
  });

  Future<bool> executerRecharge({
    required String utilisateurTelephone,
    required double montant,
    required OperatorType operateur,
  });
}

