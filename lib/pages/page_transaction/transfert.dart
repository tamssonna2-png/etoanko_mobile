import 'package:etoankopay/application/states/fonction.dart';
import 'package:etoankopay/application/utilisateur_provider/connexion_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/transaction_model.dart';
import '../../application/transaction_provider/transfert_provider.dart';

class Transfert extends ConsumerStatefulWidget {
  const Transfert({Key? key}) : super(key: key);

  @override
  ConsumerState<Transfert> createState() => _OperationScreenState();
}

class _OperationScreenState extends ConsumerState<Transfert> {
  final _formKey = GlobalKey<FormState>();
  final _montantController = TextEditingController();
  final _numeroController = TextEditingController();

  // État local du loader
  bool _isLoading = false;

  TransactionType _operationType = TransactionType.TRANSFERT;
  OperatorType _selectedOperator = OperatorType.ORANGE_MONEY;

  @override
  void dispose() {
    _montantController.dispose();
    _numeroController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userConnecte = ref.watch(utilisateurConnecteProvider);
    if(userConnecte!=null){
      _selectedOperator = detecterOperateur(userConnecte.telephone);
    }

    return Scaffold(
      appBar: AppBar(title: const Text('ETOANKOPAY - Transfert')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Choix de l'opération
              SegmentedButton<TransactionType>(
                segments: const [
                  ButtonSegment(value: TransactionType.TRANSFERT, label: Text('Transfert')),
                ],
                selected: {_operationType},
                onSelectionChanged: (set) => setState(() => _operationType = set.first),
              ),
              const SizedBox(height: 20),

              // Choix de l'opérateur (Orange ou MTN)
              DropdownButtonFormField<OperatorType>(
                value: _selectedOperator,
                decoration: const InputDecoration(labelText: 'Opérateur partenaire', border: OutlineInputBorder()),
                items: const [
                  DropdownMenuItem(value: OperatorType.ORANGE_MONEY, child: Text('Orange Money Cameroun')),
                  DropdownMenuItem(value: OperatorType.MTN_MOMO, child: Text('MTN Mobile Money Cameroun')),
                ],
                onChanged: (val) => setState(() => _selectedOperator = val!),
              ),
              const SizedBox(height: 15),

              // Montant
              TextFormField(
                controller: _montantController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Montant (XAF)', border: OutlineInputBorder()),
                validator: (val) => (val == null || double.tryParse(val) == null) ? 'Entrez un montant valide' : null,
              ),
              const SizedBox(height: 15),

              // Téléphone destinataire
              TextFormField(
                controller: _numeroController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(labelText: 'Numéro du destinataire', border: OutlineInputBorder()),
                validator: (val) => (val == null || val.length < 9) ? 'Numéro invalide' : null,
              ),
              const SizedBox(height: 25),

              // Bouton de validation
              ElevatedButton(
                style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14)),
                onPressed: _isLoading ? null : () async {
                  if (_formKey.currentState!.validate()) {
                    if (userConnecte == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Aucun utilisateur connecté !'), backgroundColor: Colors.red),
                      );
                      return;
                    }

                    setState(() => _isLoading = true);

                    try {
                      final montant = double.parse(_montantController.text);
                      final destinataire = _numeroController.text;

                      final succes = await ref.read(transfertProvider.notifier).transferer(
                        montant: montant,
                        destinataire: destinataire,
                        operateur: _selectedOperator,
                      );

                      if (succes && mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Transfert effectué avec succès !'), backgroundColor: Colors.green),
                        );
                        _montantController.clear();
                        _numeroController.clear();
                      }
                    } catch (e) {
                      if (mounted) {
                        final messageErreur = e.toString().replaceAll('Exception: ', '');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(messageErreur), backgroundColor: Colors.red),
                        );
                      }
                    } finally {
                      if (mounted) {
                        setState(() => _isLoading = false);
                      }
                    }
                  }
                },
                child: _isLoading
                    ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2))
                    : const Text('Confirmer le Transfert'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}