import 'package:etoankopay/widjet/main_layout.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const new({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  int nombreGrilles=6;
  double solde = 0;
  String nomComplet="";
  final List<String> nomAction =["Recharger","Retirer","Envoyer","Historique","Profil","Tarifs"];
  final List<IconData> icons = [
  Icons.add_circle_outline, // Recharger
  Icons.arrow_downward,     // Retirer
  Icons.send,               // Envoyer
  Icons.history,            // Historique
  Icons.person,             // Profil
  Icons.sell_outlined,      // Tarifs
];
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      titre: "Ta", 
      nomCompletUtilisateur: " ",
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
                Text("${solde.toString()} FCFA"),
                Text("$nomComplet")
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
                  onPressed: (){}, 
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