/*import 'package:etoankopay/application/states/fonction.dart';
import 'package:etoankopay/application/utilisateur_provider/connexion_provider.dart';
import 'package:etoankopay/application/transaction_provider/recharge_provider.dart';
import 'package:etoankopay/domain/transaction_model.dart';
import 'package:etoankopay/widjet/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Recharge extends ConsumerStatefulWidget {
  const Recharge({super.key});

  @override
  ConsumerState<Recharge> createState()=> _RechargeState();
  
}

class _RechargeState extends ConsumerState<Recharge>{
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _montantController;
  late final TextEditingController _inputTelephoneController;
  
  final List<String>modesPaiement =[
      "MTN Mobile Money",
      "Orange Money",
    ];

  @override
  void initState(){
    super.initState();
    _montantController = TextEditingController();

    final userConnecte = ref.read(utilisateurConnecteProvider);
    _inputTelephoneController = TextEditingController(
      text: userConnecte?.telephone ?? "",
    );
  }
  @override
  void dispose(){
    _montantController.dispose();
    _inputTelephoneController.dispose();
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    
    final _choixSelection = ref.watch(modePaiementSelectionneProvider);
    final utilisateurConnecte = ref.watch(utilisateurConnecteProvider);
    String telephoneUtilisateur ="";
    if (utilisateurConnecte !=null){
      telephoneUtilisateur = utilisateurConnecte.telephone;
    }
    return MainLayout(
      nomCompletUtilisateur: utilisateurConnecte?.nom ?? "",
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 10),
                const Center(
                  child: Text(
                    "Recharger mon compte",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),

                // Champ Montant
                TextFormField(
                  controller: _montantController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "MONTANT (FCFA)",
                    hintText: "Ex: 5000",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Vous devez remplir ce champ";
                    }
                    final parsed = double.tryParse(value);
                    if (parsed == null || parsed <= 0) {
                      return "Veuillez entrer un montant valide";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Champ Téléphone pré-rempli
                
                TextFormField(
                  controller: _inputTelephoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: "NUMÉRO DE TÉLÉPHONE",
                    border: OutlineInputBorder(),
                  ),
                  
                  onChanged: (value) {
                    final operateur = detecterOperateur(telephoneUtilisateur);
                      if (operateur == OperatorType.MTN_MOMO) {
                        ref.read(modePaiementSelectionneProvider.notifier).changerMode("MTN Mobile Money");
                      } else if (operateur == OperatorType.ORANGE_MONEY) {
                        ref.read(modePaiementSelectionneProvider.notifier).changerMode("Orange Money");
                       }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Vous devez remplir ce champ";
                    }
                    if (value.length < 9) {
                      return "Numéro de téléphone invalide";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Choix du mode de paiement
                ListView.builder(
                  itemCount: modesPaiement.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final option = modesPaiement[index];
                    return RadioListTile<String>(
                      title: Text(option),
                      value: option,
                      groupValue: _choixSelection,
                      onChanged: (String? nouvelleValeur) {
                        ref
                            .read(modePaiementSelectionneProvider.notifier)
                            .changerMode(nouvelleValeur);
                      },
                    );
                  },
                ),
                const SizedBox(height: 20),

                // Bouton de validation
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      if (_choixSelection == null) {

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Veuillez sélectionner un mode de paiement"),
                            backgroundColor: Colors.orange,
                          ),
                        );
                        return;
                      }

                      final montantSaisie = double.parse(_montantController.text);

                      OperatorType operateur;
                      if(_choixSelection=="MTN Mobile Money"){
                        operateur = OperatorType.MTN_MOMO;
                      }else if(_choixSelection=="Orange Money"){
                        operateur = OperatorType.ORANGE_MONEY;
                      }else{
                        operateur = OperatorType.UNKNOWN;
                      }
                      

                      try {
                        final succes = await ref
                            .read(rechargeProvider.notifier)
                            .recharger(montantSaisie,operateur);

                        if (succes && context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Recharge effectuée avec succès !"),
                              backgroundColor: Colors.green,
                            ),
                          );
                          Navigator.pop(context);
                        } else if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Échec de la recharge. Veuillez réessayer."),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      } catch (e) {
                        debugPrint("Erreur lors de la recharge: $e");
                      }
                    }
                  },
                  child: const Text("Recharger mon compte"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await ref.read(rechargeProvider.notifier).reinitialiserSolde();
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Solde réinitialisé à 0 FCFA !')),
                      );
                    }
                  },
                  child: const Text('Mettre le solde à 0'),
                )
              ],
            ),
          ),
        ),
      ),
    );
    
  }
}*/

import 'package:etoankopay/application/states/fonction.dart';
import 'package:etoankopay/application/utilisateur_provider/connexion_provider.dart';
import 'package:etoankopay/application/transaction_provider/recharge_provider.dart';
import 'package:etoankopay/domain/transaction_model.dart';
import 'package:etoankopay/widjet/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Recharge extends ConsumerStatefulWidget {
  const Recharge({super.key});

  @override
  ConsumerState<Recharge> createState() => _RechargeState();
}

class _RechargeState extends ConsumerState<Recharge> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _montantController;
  late final TextEditingController _inputTelephoneController;

  final List<String> modesPaiement = [
    "MTN Mobile Money",
    "Orange Money",
  ];

  @override
  void initState() {
    super.initState();
    _montantController = TextEditingController();

    final userConnecte = ref.read(utilisateurConnecteProvider);
    final phoneInitial = userConnecte?.telephone ?? "";
    _inputTelephoneController = TextEditingController(text: phoneInitial);

    // Auto-détection au lancement si le numéro est déjà pré-rempli
    if (phoneInitial.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _adapterOperateur(phoneInitial);
      });
    }
  }

  @override
  void dispose() {
    _montantController.dispose();
    _inputTelephoneController.dispose();
    super.dispose();
  }

  // Helper pour cocher automatiquement le bon mode
  void _adapterOperateur(String phone) {
    final op = detecterOperateur(phone);
    if (op == OperatorType.MTN_MOMO) {
      ref.read(modePaiementSelectionneProvider.notifier).changerMode("MTN Mobile Money");
    } else if (op == OperatorType.ORANGE_MONEY) {
      ref.read(modePaiementSelectionneProvider.notifier).changerMode("Orange Money");
    }
  }

  @override
  Widget build(BuildContext context) {
    final choixSelection = ref.watch(modePaiementSelectionneProvider);
    final utilisateurConnecte = ref.watch(utilisateurConnecteProvider);

    return MainLayout(
      nomCompletUtilisateur: utilisateurConnecte?.nom ?? "",
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 10),
                const Center(
                  child: Text(
                    "Recharger mon compte",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),

                // Champ Montant
                TextFormField(
                  controller: _montantController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "MONTANT (FCFA)",
                    hintText: "Ex: 5000",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Vous devez remplir ce champ";
                    }
                    final parsed = double.tryParse(value);
                    if (parsed == null || parsed <= 0) {
                      return "Veuillez entrer un montant valide";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Champ Téléphone pré-rempli
                TextFormField(
                  controller: _inputTelephoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: "NUMÉRO DE TÉLÉPHONE",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) => _adapterOperateur(value),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Vous devez remplir ce champ";
                    }
                    if (value.length < 9) {
                      return "Numéro de téléphone invalide";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Choix du mode de paiement
                ListView.builder(
                  itemCount: modesPaiement.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final option = modesPaiement[index];
                    return RadioListTile<String>(
                      title: Text(option),
                      value: option,
                      groupValue: choixSelection,
                      onChanged: (String? nouvelleValeur) {
                        ref
                            .read(modePaiementSelectionneProvider.notifier)
                            .changerMode(nouvelleValeur);
                      },
                    );
                  },
                ),
                const SizedBox(height: 20),

                // Bouton de validation
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      if (choixSelection == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Veuillez sélectionner un mode de paiement"),
                            backgroundColor: Colors.orange,
                          ),
                        );
                        return;
                      }

                      final montantSaisie = double.parse(_montantController.text);
                      final telephoneSaisi = _inputTelephoneController.text;
                      final operateur = detecterOperateur(telephoneSaisi);

                      try {
                        final succes = await ref
                            .read(rechargeProvider.notifier)
                            .recharger(
                              montantSaisie,
                              operateur
                            );

                        if (succes && context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Recharge effectuée avec succès !"),
                              backgroundColor: Colors.green,
                            ),
                          );
                          Navigator.pop(context);
                        } else if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Échec de la recharge. Veuillez réessayer."),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      } catch (e) {
                        debugPrint("Erreur lors de la recharge: $e");
                      }
                    }
                  },
                  child: const Text("Recharger mon compte"),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    await ref.read(rechargeProvider.notifier).reinitialiserSolde();
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Solde réinitialisé à 0 FCFA !')),
                      );
                    }
                  },
                  child: const Text('Mettre le solde à 0'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}