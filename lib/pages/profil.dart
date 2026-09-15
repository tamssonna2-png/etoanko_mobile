import 'package:etoankopay/application/utilisateur_provider/connexion_provider.dart';
import 'package:etoankopay/pages/page_identification/connexion.dart';
//import 'package:etoankopay/application/inscription_provider.dart';
import 'package:etoankopay/widjet/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Profil extends ConsumerWidget {
  const Profil({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final utilisateurConnecte = ref.watch(utilisateurConnecteProvider);
    final utilisateur = ref.watch(utilisateurConnecteProvider.notifier);
    return MainLayout(
      nomCompletUtilisateur: utilisateurConnecte?.nom ?? "", 
      child: Column(
        children: [
          Container(
            child: ElevatedButton.icon(
              onPressed: (){
                utilisateur.seDeconnecter();
                Navigator.push(context, 
                PageRouteBuilder(pageBuilder: (_,__,___)=>Connexion())
                );
              }, 
              label: Text("deconnexion"),
              icon: Icon(Icons.logout),
              ),
          )
        ],
      ),
      );
  }
}