import 'dart:convert';

import 'package:http/http.dart' as http;

class Transfert {
  final int amount;
  final String currency;
  final String destinationPhone;
  final String? description;

  Transfert({
    required this.amount,
    required this.currency,
    required this.destinationPhone,
    this.description
  });

  Map<String,dynamic> toJson(){
    return{
      'amount': amount,
      'currency': currency,
      'destination_phone': destinationPhone,
      if(description!=null) 'description': description
    };
  }

  factory Transfert.fromJson(Map<String,dynamic> json){
    return Transfert(
      amount: json['amount'], 
      currency: json['currency'], 
      destinationPhone: json['destination_phone']
      );
  }

  static Future<void> transferApi(Transfert demande)async{
    final apiKey ='sk_test_SeTfs11yBBQIePtkR4ZwO2OPUhtwNXZ6';
    final url = Uri.parse('https://etoanko-pay.arited.org/v1/transfers');

    try {
      final reponse =await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization':'Bearer $apiKey',
          'Idempotency-key':DateTime.now().microsecondsSinceEpoch.toString(),
        },
        body: jsonEncode(demande.toJson())
      );
      if(reponse.statusCode==201){
        final Map<String,dynamic> data = jsonDecode(reponse.body);
        Transfert transfert = Transfert.fromJson(data);
        print("Transfert reussi");
        print(transfert);
      }else{
        print("Erreur ${reponse.statusCode} : ${reponse.body}");
      }
    } catch (e) {
      print("Erreur $e");
    }
  }
}