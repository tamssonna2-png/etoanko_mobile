import 'package:etoankopay/application/utilisateur_provider/connexion_provider.dart';
import 'package:etoankopay/pages/page_transaction/transfert.dart';
import 'package:etoankopay/pages/page_historique/historique.dart';
import 'package:etoankopay/pages/profil.dart';
import 'package:etoankopay/pages/page_transaction/recharge.dart';
import 'package:etoankopay/pages/page_transaction/retrait.dart';
import 'package:etoankopay/pages/tarifs.dart';
import 'package:etoankopay/widjet/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Dashboard extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    int nombreGrilles=6;
    //double solde = 0;
    final utilisateur = ref.watch(utilisateurConnecteProvider);
    final List<String> nomAction =["Recharger","Retirer","Envoyer","Historique","Profil","Tarifs"];
    final List<IconData> icons = [
      Icons.add_circle_outline, 
      Icons.arrow_downward,     
      Icons.send,              
      Icons.history,            
      Icons.person,             
      Icons.sell_outlined,      
    ];
    final List<Widget> page =[
      Recharge(),
      Retrait(),
      Transfert(),
      Historique(),
      Profil(),
      Tarifs()
    ];
    return MainLayout(
      titre: "Daashboard", 
      nomCompletUtilisateur: utilisateur?.nom ?? "",
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color.fromARGB(97, 180, 174, 174),
              borderRadius: BorderRadius.circular(16)
            ),
            child: Column(
              children: [
                Text("SOLDE DISPONIBLE "),
                Text("${utilisateur?.solde.toString()} FCFA"),
                Text("${utilisateur?.nom}")
              ],
            )
            
          ),
          SizedBox(),
          Container(
            margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color.fromARGB(97, 180, 174, 174),
              borderRadius: BorderRadius.circular(16)
            ),
            child: GridView.builder(
              itemCount: nombreGrilles,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 40,
                mainAxisSpacing: 40,
                childAspectRatio: 1.2
                ), 
              itemBuilder: (contex,index){
                return ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 186, 192, 196),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                    )
                  ),
                  onPressed: (){
                    Navigator.push(
                      context, 
                      PageRouteBuilder(pageBuilder: (_,__,___)=>page[index])
                      );
                  }, 
                  label:  Text(
                    nomAction[index]
                  ),
                  icon: Icon(icons[index]),
                );
              },
            ),
          )
        ],
      )
      
      ) ;
  }
  
}

 
  
