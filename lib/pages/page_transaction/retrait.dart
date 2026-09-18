
import 'package:etoankopay/application/states/fonction.dart';
import 'package:etoankopay/application/utilisateur_provider/connexion_provider.dart';
import 'package:etoankopay/application/transaction_provider/retrait_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/transaction_model.dart';

class Retrait extends ConsumerStatefulWidget {
  const Retrait({Key? key}) : super(key: key);

  @override
  ConsumerState<Retrait> createState() => _OperationScreenState();
}

class _OperationScreenState extends ConsumerState<Retrait> {
  final _formKey = GlobalKey<FormState>();
  final _montantController = TextEditingController();

  // Indicateur local pour le chargement
  bool _isLoading = false;

  TransactionType _operationType = TransactionType.RETRAIT;
  OperatorType _selectedOperator = OperatorType.ORANGE_MONEY;

  @override
  void dispose() {
    _montantController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userConnecte = ref.watch(utilisateurConnecteProvider);
    if(userConnecte!=null){
      _selectedOperator = detecterOperateur(userConnecte.telephone);
    }
    return Scaffold(
      appBar: AppBar(title: const Text('ETOANKOPAY - Retrait')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Choix de l'opération
              SegmentedButton<TransactionType>(
                segments: const [
                  ButtonSegment(
                    value: TransactionType.RETRAIT,
                    label: Text('Retrait'),
                  ),
                ],
                selected: {_operationType},
                onSelectionChanged: (set) =>
                    setState(() => _operationType = set.first),
              ),
              const SizedBox(height: 20),

              // Choix de l'opérateur (Orange ou MTN)
              DropdownButtonFormField<OperatorType>(
                value: _selectedOperator,
                decoration: const InputDecoration(
                  labelText: 'Opérateur partenaire',
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(
                    value: OperatorType.ORANGE_MONEY,
                    child: Text('Orange Money Cameroun'),
                  ),
                  DropdownMenuItem(
                    value: OperatorType.MTN_MOMO,
                    child: Text('MTN Mobile Money Cameroun'),
                  ),
                ],
                onChanged: (val) => setState(() => _selectedOperator = val!),
              ),
              const SizedBox(height: 15),

              // Montant
              TextFormField(
                controller: _montantController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Montant (XAF)',
                  border: OutlineInputBorder(),
                ),
                validator: (val) => (val == null || double.tryParse(val) == null)
                    ? 'Entrez un montant valide'
                    : null,
              ),
              const SizedBox(height: 25),

              // Bouton avec gestion du chargement et du bloc try/catch
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: _isLoading
                    ? null
                    : () async {
                        if (_formKey.currentState!.validate()) {
                          if (userConnecte == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Aucun utilisateur connecté !'),
                                backgroundColor: Colors.red,
                              ),
                            );
                            return;
                          }

                          // Activer le loader
                          setState(() => _isLoading = true);

                          try {
                            final montant = double.parse(_montantController.text);

                            // Appel du nouveau Notifier
                            final succes = await ref
                                .read(retraitProvider.notifier)
                                .retirer(
                                  montant: montant,
                                  operateur: _selectedOperator,
                                );

                            if (succes && mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Retrait effectué avec succès !'),
                                  backgroundColor: Colors.green,
                                ),
                              );
                              _montantController.clear();
                            }
                          } catch (e) {
                            // Attrape l'exception envoyée par le Repository (ex: "Solde insuffisant...")
                            if (mounted) {
                              final messageErreur = e
                                  .toString()
                                  .replaceAll('Exception: ', '');

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(messageErreur),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          } finally {
                            // Désactiver le loader dans tous les cas
                            if (mounted) {
                              setState(() => _isLoading = false);
                            }
                          }
                        }
                      },
                child: _isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Initier le Retrait'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}