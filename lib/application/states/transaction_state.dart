import '../../domain/transaction_model.dart';

enum TransactionRequestStatus { INITIAL, LOADING, SUCCESS, ERROR }

class TransactionState {
  final TransactionRequestStatus status;
  final List<TransactionModel> transactions;
  final TransactionModel? selectedTransaction;
  final String? errorMessage;

  TransactionState({
    this.status = TransactionRequestStatus.INITIAL,
    this.transactions = const [],
    this.selectedTransaction,
    this.errorMessage,
  });

  factory TransactionState.initial() {
    return TransactionState(
      status: TransactionRequestStatus.INITIAL,
      transactions: [],
      selectedTransaction: null,
      errorMessage: null,
    );
  }

  TransactionState copyWith({
    TransactionRequestStatus? status,
    List<TransactionModel>? transactions,
    TransactionModel? selectedTransaction,
    String? errorMessage,
  }) {
    return TransactionState(
      status: status ?? this.status,
      transactions: transactions ?? this.transactions,
      selectedTransaction: selectedTransaction ?? this.selectedTransaction,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}