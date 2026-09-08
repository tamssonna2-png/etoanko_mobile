import 'package:flutter/material.dart';
class MainLayout extends StatelessWidget {
  final String titre;
  final String nomCompletUtilisateur;
  final Widget child;
  final List<Widget>? actions;
  
  
  const new({
    super.key,
    this.titre = "MoneyAPI",
    required this.nomCompletUtilisateur,
    required this.child,
    this.actions,
    
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titre),
        backgroundColor: Colors.black,
        actions: actions,
      ),
//il y'aura trois boutons
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: child,
          ) 
      ),
    );
  }
}