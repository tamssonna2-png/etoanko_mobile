import 'package:etoankopay/domain/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TransactionDetailScreen extends ConsumerWidget {
  final TransactionModel transaction;
  const TransactionDetailScreen({
    Key? key,
    required this.transaction
    }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    // Écoute directe du provider
    //final tx = ref.watch(selectedTransactionProvider);
    final tx = transaction;
    /*if (tx == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Détail')),
        body: const Center(child: Text('Aucune transaction sélectionnée')),
      );
    }*/

    return Scaffold(
      appBar: AppBar(title: Text('Détails : ${tx.reference}')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Montant : ${tx.montant} XAF', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const Divider(),
                Text('Opération : ${tx.type.name}'),
                Text('Opérateur : ${tx.operateurDest.name}'),
                Text('Destinataire : ${tx.numeroDestinataire}'),
                Text('Frais : ${tx.frais} XAF'),
                Text('Date : ${tx.date}'),
                Text('Statut : ${tx.statut.name}', style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}