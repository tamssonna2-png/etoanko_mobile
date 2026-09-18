import 'dart:convert';

import 'package:http/http.dart' as http;

class Recharge {
  final int amount;
  final String currency;
  final String custumerPhone;
  final String? custumerName;
  final String? paymentMethod;
  final String operator;
  final String? description;
  //final List<String> metatdata;
  Recharge({
    required this.amount,
    required this.currency,
    required this.custumerPhone,
    this.custumerName,
    this.paymentMethod,
    required this.operator,
    this.description,
    //required this.metatdata
  });

  factory Recharge.fromJson(Map<String,dynamic> json){
    return Recharge(
      amount: json['amount'],
      currency: json['currency'],
      custumerPhone: json['customer_phone'],
      custumerName: json['customer_name'],
      paymentMethod: json['payment_method'],
      operator: json['operator'],
      description: json['description'],
      //metatdata: json['metadata'] 
      );
  }

  Map<String,dynamic> toJson(){
    return{
      'amount': amount,
      'currency': currency,
      'customer_phone': custumerPhone,
      if (custumerName != null) 'customer_name': custumerName,
      if (paymentMethod != null) 'payment_method': paymentMethod,
      'operator': operator,
      if (description != null) 'description': description,

    };
  }

  static Future<void> rechargeApi(Recharge demande) async{
    final apiKey = 'sk_test_SeTfs11yBBQIePtkR4ZwO2OPUhtwNXZ6';
    //final id =5;
    final url = Uri.parse('https://etoanko-pay.arited.org/v1/charges');
    try {
      final reponse = await http.post(
        url,
        headers: {
        'Content-Type': 'application/json',
        'Accept':'application/json',
        'Authorization':'Bearer $apiKey',
        'Idempotency-Key': DateTime.now().microsecondsSinceEpoch.toString(),
        }, 
        body: jsonEncode(demande.toJson()),
      );

      if(reponse.statusCode == 201){
        final Map<String,dynamic> data = jsonDecode(reponse.body);
        print("Recharge initiée avec succès !");
        Recharge recharge = Recharge.fromJson(data);
        print(recharge);
      }else{
        print("Erreur consultation (${reponse.statusCode}): ${reponse.body}");
      }
    } catch (e) {
      print("erreur $e");
    }
  }
}