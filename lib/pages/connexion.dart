import 'package:etoankopay/pages/dashboard.dart';
import 'package:etoankopay/pages/inscription.dart';
import 'package:flutter/material.dart';

class Connexion extends StatefulWidget {
  const Connexion({super.key});

  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {

  final _fomkey = GlobalKey<FormState>();
  final email = TextEditingController();
  final motDePasse = TextEditingController();
  bool _souvenirDeMoi = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _fomkey,
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Connexion à votre compte",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text("Entrez vos identifiants pour acceder a votre dashbord."),

                Container(
                  margin:  EdgeInsets.all(20),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "ADRESSE EMAIL",
                      hintText: "vous@exemple.com",
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value==null || value.isEmpty) {
                        return "Vous devez completer ce champ";
                      }
                      return null;
                    },
                    controller: email,
                  ),
                ),

                Container(
                  margin:  EdgeInsets.all(20),
                  child: TextFormField(
                    obscureText: true,
                    enableSuggestions: false,
                    decoration: InputDecoration(
                      labelText: "MOT DE PASSE",
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value==null || value.isEmpty) {
                        return "Vous devez completer ce champ";
                      }
                      return null;
                    },
                    controller: motDePasse,
                  ),
                ),

                CheckboxListTile(
                  title: Text("Se souvennir de moi"),
                  value: _souvenirDeMoi, 
                  onChanged: (bool? nouvelleValeur){
                    setState(() {
                      _souvenirDeMoi = nouvelleValeur?? false;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                SizedBox(
                  child: ElevatedButton.icon(
                    onPressed: (){
                      if(_fomkey.currentState!.validate()){
                        print("object 2");
                        Navigator.push(
                          context, 
                          PageRouteBuilder(pageBuilder: (_,__,___)=>Dashboard()
                          )
                        );
                      }
                    }, 
                    label: Text("Se connecter"),
                    icon: Icon(Icons.login),
                    ),
                ),
                Text("Pas de compte ?"),
                SizedBox(
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                        context, 
                        PageRouteBuilder(
                          pageBuilder: (_,__,___)=>Inscription()
                          ),
                        );
                    }, 
                    child: Text("Créer un compte gratuit")
                    ),
                )
              ],
            )
          ),
        )
      ),
    );
  }
}