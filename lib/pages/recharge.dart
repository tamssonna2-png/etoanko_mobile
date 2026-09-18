import 'package:etoankopay/widjet/main_layout.dart';
import 'package:flutter/material.dart';

class Recharge extends StatefulWidget {
  const new({super.key});

  @override
  State<Recharge> createState() => _RechargeState();
}

class _RechargeState extends State<Recharge> {
  final montant = TextEditingController(); 
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      nomCompletUtilisateur: "",
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.85,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey
              ),
              child: Text("Recharger mon compte"),
            ),
            //Text("test")
          ],
        ),
      ),
    );
  }
}