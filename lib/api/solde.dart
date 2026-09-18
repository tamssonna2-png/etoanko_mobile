import 'dart:convert';
//import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class Solde {
  final String object;
  final String currency;
  final int available;
  final int pending;
  final bool livemode;

  const Solde({
    required this.object,
    required this.currency,
    required this.available,
    required this.pending,
    required this.livemode
  });

  factory Solde.fromJson(Map<String,dynamic> json){
    return Solde(
      object: json['object'], 
      currency: json['currency'], 
      available: json['available'], 
      pending: json['pending'], 
      livemode: json['livemode']
      );
  }

  static Future<double> fetchSolde()async{
  //await dotenv.load(fileName: ".env");
  //final apiKey = dotenv.env['ETOANKO_SECRET_KEY'];
  final apiKey = 'sk_test_SeTfs11yBBQIePtkR4ZwO2OPUhtwNXZ6';
  final url = Uri.parse('https://etoanko-pay.arited.org/v1/balance');
  try{
    final reponse = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept':'application/json',
        'Authorization':'Bearer $apiKey'
      },   
    );
    if(reponse.statusCode ==200){
      final Map<String,dynamic> data = jsonDecode(reponse.body);
      Solde solde = Solde.fromJson(data);

      final double availableBalance =(solde.available as num).toDouble();
      return availableBalance;
    }else{
      throw Exception("Erreur API ${reponse.statusCode} : ${reponse.body}");
    }
    
  }catch (e){
    print("erreur $e");
  } 
  return 0.0;
}
}