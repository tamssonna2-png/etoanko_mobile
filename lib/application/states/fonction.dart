
import 'package:etoankopay/domain/transaction_model.dart';

OperatorType detecterOperateur(String telephone) {
  
  final cleanNumber = telephone.replaceAll(RegExp(r'\s+|-|\+'), '');

  String localNumber = cleanNumber;
  if (cleanNumber.length > 9) {
    localNumber = cleanNumber.substring(cleanNumber.length - 9);
  }

  if (localNumber.length < 9) {
    return OperatorType.UNKNOWN; 
  }

  if (RegExp(r'^(67|650|651|652|653|654|680|681|682|683)').hasMatch(localNumber)) {
    return OperatorType.MTN_MOMO;
  }

  if (RegExp(r'^(69|655|656|657|658|659|685|686|687|688|689)').hasMatch(localNumber)) {
    return OperatorType.ORANGE_MONEY;
  }

  return OperatorType.UNKNOWN;
}