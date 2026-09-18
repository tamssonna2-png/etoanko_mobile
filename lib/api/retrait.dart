import 'dart:convert';

import 'package:http/http.dart' as http;

class Retrait {
  final int amount;
  final String currency;
  final String destinationPhone;
  final String recipientName;
  final String operator;
  final String? description;

  Retrait({
    required this.amount,
    required this.currency,
    required this.destinationPhone,
    required this.recipientName,
    required this.operator,
    this.description,
  });

  factory Retrait.fromJson(Map<String,dynamic>json){
    return Retrait(
      amount: json['amount'],
      currency: json['currency'],
      destinationPhone:  json['destination_phone'],
      recipientName: json['recipient_name'],
      operator: json['operator'],
      description: json['description'],
    );
  }

  Map<String,dynamic> toJson(){
    return{
      'amount':amount,
      'currency':currency,
      'destination_phone':destinationPhone,
      'recipient_name':recipientName,
      'operator':operator,
      if(description!=null) 'description': description

    };
  }

  static Future<void> retraitApi(Retrait demande)async{
    final apiKey = 'sk_test_SeTfs11yBBQIePtkR4ZwO2OPUhtwNXZ6';
    final url =Uri.parse('https://etoanko-pay.arited.org/v1/payouts');
    try {
      final reponse = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept':'application/json',
          'Authorization':'Bearer $apiKey',
          'Idempotency-Key': DateTime.now().microsecondsSinceEpoch.toString(),
        }, 
        body: jsonEncode(demande.toJson())
      );
      if(reponse.statusCode ==201){
        final Map<String,dynamic> data = jsonDecode(reponse.body);
        Retrait retrait = Retrait.fromJson(data);
        print("Retrait effectuer avec succes");
        print(retrait);
      }else{
         print("Erreur consultation (${reponse.statusCode}): ${reponse.body}");
      }
    } catch (e) {
      print("erreur :$e");
    }
  }
}