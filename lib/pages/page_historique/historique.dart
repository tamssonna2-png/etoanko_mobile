import 'package:etoankopay/application/transaction_provider/transaction_historique_provider.dart';
import 'package:etoankopay/application/utilisateur_provider/connexion_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/transaction_model.dart';
import '../../application/states/transaction_state.dart';
import 'transaction_detail_screen.dart';

class Historique extends ConsumerWidget {
  const Historique({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Écoute directe du StateNotifier
    final state = ref.watch(transactionStateNotifierProvider);//comment gerer transactonStateNotifierProvider ? ps je souhaite le creer
    final utilisateurConnecte = ref.watch(utilisateurConnecteProvider);

    if(utilisateurConnecte==null){
      return const Scaffold(
        body:  Center(
          child: Text("Veullez vous connecter !"),
        ),
      );
    }
    final telephoneUtilisateur= utilisateurConnecte.telephone;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (state.status == TransactionRequestStatus.INITIAL) {
        ref.read(transactionStateNotifierProvider.notifier).chargerHistorique(telephoneUtilisateur);
      }
    });


    return Scaffold(
      appBar: AppBar(
        title:  Text('Historique des Transactions ${utilisateurConnecte.nom}'),
        actions: [
          // Bouton rafraîchir manuel
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(transactionStateNotifierProvider.notifier).chargerHistorique(telephoneUtilisateur);
            },
          ),
        ],
      ),
      body: Builder(
        builder: (context) {
          // 1. État de chargement
          if (state.status == TransactionRequestStatus.LOADING && state.transactions.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          // 2. État d'erreur
          if (state.status == TransactionRequestStatus.ERROR && state.transactions.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, color: Colors.red, size: 48),
                  const SizedBox(height: 10),
                  Text(
                    'Erreur : ${state.errorMessage ?? "Impossible de charger les données"}',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      ref.read(transactionStateNotifierProvider.notifier).chargerHistorique(telephoneUtilisateur);
                    },
                    child: const Text('Réessayer'),
                  ),
                ],
              ),
            );
          }

          // 3. Liste vide
          if (state.transactions.isEmpty) {
            return const Center(
              child: Text(
                'Aucune transaction effectuée pour le moment.',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            );
          }

          // 4. Affichage de la liste avec possibilité de glisser pour rafraîchir
          return RefreshIndicator(
            onRefresh: () async {
              await ref.read(transactionStateNotifierProvider.notifier).chargerHistorique(telephoneUtilisateur);
            },
            child: ListView.separated(
              padding: const EdgeInsets.all(12),
              itemCount: state.transactions.length,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final tx = state.transactions[index];
                String labelType;
                switch (tx.type) {
                  case TransactionType.RETRAIT:
                    labelType = 'Retrait';
                    break;
                  case TransactionType.RECHARGE:
                    labelType = 'Recharge';
                    break;
                  case TransactionType.TRANSFERT:
                    labelType = (tx.numeroDestinataire == telephoneUtilisateur) 
                        ? 'Transfert reçu' 
                        : 'Transfert';
                    break;
                }

                
                final isEntree = tx.type == TransactionType.RECHARGE || (tx.type == TransactionType.TRANSFERT && tx.numeroDestinataire == telephoneUtilisateur);

                IconData iconType;
                Color couleurIcone;
                Color couleurFond;
                switch (tx.type) {
                  case TransactionType.RECHARGE:
                    iconType = Icons.arrow_downward;
                    couleurIcone = Colors.green.shade700;
                    couleurFond = Colors.green.shade50;
                    break;
                  case TransactionType.TRANSFERT:
                    iconType = Icons.arrow_forward;
                    couleurIcone = Colors.blue.shade800;
                    couleurFond = Colors.blue.shade50;
                    break;
                  case TransactionType.RETRAIT:
                    iconType = Icons.arrow_upward;
                    couleurIcone = Colors.red;
                    couleurFond = Colors.red.shade50;
                    break;
                }

                return Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.grey.shade200),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    // Icône selon le type
                    leading: CircleAvatar(
                      backgroundColor: couleurFond,
                      child: Icon(
                        iconType,
                        color: couleurIcone,
                      ),
                    ),
                    // Titre et opérateur
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          labelType,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          '${isEntree? "+" : "-"}${tx.montant.toStringAsFixed(0)} XAF',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: isEntree ? Colors.red.shade700 : const Color(0xFF0F172A),
                          ),
                        ),
                      ],
                    ),
                    // Sous-titre : destinataire et date
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Réf : ${tx.reference}''${tx.numeroDestinataire != null ? " • Vers : ${tx.numeroDestinataire}" : ""}',),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildOperatorBadge(tx.operateurDest),
                              Text(
                                '${tx.date.day.toString().padLeft(2, '0')}/${tx.date.month.toString().padLeft(2, '0')} à ${tx.date.hour}h${tx.date.minute.toString().padLeft(2, '0')}',
                                style: const TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
                    // Clic vers les détails
                    onTap: () {
                      // 1. On mémorise la transaction sélectionnée dans le Provider
                      //ref.read(transactionStateNotifierProvider.notifier).selectionnerTransaction(tx);

                      // 2. On ouvre la vue détail (qui n'a pas besoin de nouveau repository)
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  TransactionDetailScreen(transaction: tx),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  // Petit badge pour afficher Orange Money, MTN MoMo ou Etoanko
  Widget _buildOperatorBadge(OperatorType operateur) {
    Color bg;
    Color texte;
    String label;

    switch (operateur) {
      case OperatorType.ORANGE_MONEY:
        bg = const Color(0xFFFF7900).withOpacity(0.15);
        texte = const Color(0xFFFF7900);
        label = 'Orange';
        break;
      case OperatorType.MTN_MOMO:
        bg = const Color(0xFFFFCC00).withOpacity(0.25);
        texte = const Color(0xFF8A6B00);
        label = 'MTN MoMo';
        break;
      default:
        bg = Colors.black;
        texte = const Color(0xFF8A6B00);
        label = 'Autre';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: texte),
      ),
    );
  }
}