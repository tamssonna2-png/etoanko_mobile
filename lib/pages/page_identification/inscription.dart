
//import 'package:etoankopay/application/connexion_provider.dart';
import 'package:etoankopay/application/utilisateur_provider/inscription_provider.dart';
//import 'package:etoankopay/data/inscription_repository.dart';
import 'package:etoankopay/domain/utilisateur.dart';
import 'package:etoankopay/main.dart';
import 'package:etoankopay/pages/dashboard.dart';
import 'package:etoankopay/pages/page_identification/terms_conditions_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Inscription extends ConsumerStatefulWidget{
  const Inscription({super.key});

  @override
  ConsumerState<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends ConsumerState<Inscription> {
  final _fomkey = GlobalKey<FormState>();
  final nomComplet = TextEditingController();
  final email = TextEditingController();
  final telephone = TextEditingController();
  final motDePasse = TextEditingController();
  final confirmaionMotDePasse = TextEditingController();
  final codePin = TextEditingController();
  final confirmationCodePin = TextEditingController();
  bool _conditionAcceptee =false;
  @override
  void dispose() {
    nomComplet.dispose();
    email.dispose();
    telephone.dispose();
    motDePasse.dispose();
    confirmaionMotDePasse.dispose();
    codePin.dispose();
    confirmationCodePin.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 16),
          child: Form(
        key: _fomkey,
        child: Column(
          children: [
            Text(
              "Créer votre compte",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Nom complet",
                  hintText: "Entrez votre nom", 
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value ==null || value.isEmpty) {
                   return "Vous devez completer ce champ"; 
                  }
                  return null;
                },
                controller: nomComplet,
              ),
            ),

            Container(
              margin:  EdgeInsets.all(20),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "EMAIL",
                  hintText: "vous@exemple.com",
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value==null || value.isEmpty) {
                    return "Vous devez completer ce champ";
                  }
                  final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
                  if(!emailRegex.hasMatch(value)){
                    return "Adresse e-mail invalide";
                  }
                  return null;
                },
                controller: email,
              ),
            ),

            Container(
              margin:  EdgeInsets.all(20),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "TÉLÉPHONE",
                  hintText: "691234567",
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value==null || value.isEmpty) {
                    return "Vous devez completer ce champ";
                  }
                  return null;
                },
                controller: telephone,
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
            Container(
              margin:  EdgeInsets.all(20),
              child: TextFormField(
                obscureText: true,
                enableSuggestions: false,
                decoration: InputDecoration(
                  labelText: "CONFIMER",
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value==null || value.isEmpty) {
                    return "Vous devez completer ce champ";
                  }
                  return null;
                },
                controller: confirmaionMotDePasse,
              ),
            ),
            
            Container(
              margin:  EdgeInsets.all(20),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "CODE PIN",
                  hintText: "4 chiffres",
                  prefixIcon: Icon(Icons.key),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value==null || value.isEmpty) {
                    return "Vous devez completer ce champ";
                  }
                  if(value.length!=4){
                    return "Entrez un code d 4 chiffres exacts";
                  }
                  return null;
                },
                controller: codePin,
              ),
            ),
            Container(
              margin:  EdgeInsets.all(20),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "CONFIRMER LE PIN",
                  hintText: "4 chiffres",
                  prefixIcon: Icon(Icons.key),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value==null || value.isEmpty) {
                    return "Vous devez completer ce champ";
                  }
                  /*if(value.length!=4){
                    return "Entrez un code d 4 chiffres exacts";
                  }*/
                  return null;
                },
                controller: confirmationCodePin,
              ),
            ),

            CheckboxListTile(
              title: Text("j'accepte les Conditions Générales d'Utilisation et la Politique de Confidentialité de Money API"),
              value: _conditionAcceptee, 
              onChanged: (bool? nouvelleValeur){
                setState(() {
                  _conditionAcceptee = nouvelleValeur?? false;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
            SizedBox(
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context, 
                  PageRouteBuilder(pageBuilder: (_,__,___)=>TermsConditionsScreen()));
                }, 
                child: Text("voir plus ...")
                ),
            ),
            SizedBox(
              child: ElevatedButton.icon(
                onPressed:_conditionAcceptee?() async{
                  if(_fomkey.currentState!.validate()){
                    try{
                    final nouvelUtilisateur = Utilisateur(
                      nom: nomComplet.text, 
                      email: email.text, 
                      telephone: telephone.text, 
                      motDePasse: motDePasse.text, 
                      codePin: codePin.text, 
                      conditionGenerale: _conditionAcceptee
                    );
                  await ref.read(utilisateurNotifierProvider.notifier).inscrireUtilisateur(nouvelUtilisateur);
                  //final listeUtilisateur = ref.read(utilisateurNotifierProvider);
                  //print("$listeUtilisateur");
                  //final succes = await ref.read(utilisateurConnecteProvider.notifier).estConnecter(email.text,motDePasse.text);
                  //cette partie est juste pour le test car il doit plutot renvoyer a la verification de l'email
                  if(mounted){
                    Navigator.pushReplacement(context,
                    PageRouteBuilder(pageBuilder: (_,__,___)=> Dashboard())
                    );
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Email ou mot de passe incorrect"),
                        backgroundColor: Colors.red,
                      )
                    );
                  }

                  }catch(e,stackTrace){
                    print("erreur $e");
                    print("$stackTrace");
                  }
                  }
                } :null, 
                label: Text("Créer mon ccompte gratuitement"),
                icon: Icon(Icons.person_add_alt),
                ),
            ),
            Text("Vous avez déjà un compte ?"),
            ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context, 
                  PageRouteBuilder(
                    pageBuilder: (_,__,___)=>MyApp()
                  )
                );
              }, 
              child: Text("Se connecter"),
            ),
          ],
        ),
      ),
          )
        ),
    );
  }
}