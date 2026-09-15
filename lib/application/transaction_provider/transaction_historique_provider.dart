import 'package:etoankopay/data/repository/sql/sqlite_transaction_repository_impl.dart';
import 'package:etoankopay/data/repository/transaction_repository.dart';
import 'package:etoankopay/application/states/transaction_state.dart';
import 'package:flutter_riverpod/legacy.dart';

class TransactionHistoriqueProvider extends StateNotifier<TransactionState>{
  final TransactionRepository repository;

  TransactionHistoriqueProvider(this.repository) : super(  TransactionState());

  /// Charger l'historique d'un utilisateur par son numéro de téléphone
  Future<void> chargerHistorique(String telephone) async {
    state = state.copyWith(status: TransactionRequestStatus.LOADING);

    try {
      final list = await repository.getTransactionsParUtilisateur(telephone);
      // Tri par date décroissante (les plus récentes en premier)
      list.sort((a, b) => b.date.compareTo(a.date));

      state = state.copyWith(
        status: TransactionRequestStatus.SUCCESS,
        transactions: list,
      );
    } catch (e) {
      state = state.copyWith(
        status: TransactionRequestStatus.ERROR,
        errorMessage: e.toString(),
      );
    }
  }
}
final transactionStateNotifierProvider =
    StateNotifierProvider<TransactionHistoriqueProvider, TransactionState>((ref) {
  // On récupère le repository SQLite principal
  final repository = ref.watch(transactionRepositoryProvider);//sqliteTransactionRepositoryProvider est cense representer quoi ?
  return TransactionHistoriqueProvider(repository);
});

