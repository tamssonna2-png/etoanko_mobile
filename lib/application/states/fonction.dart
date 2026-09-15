
import 'package:etoankopay/domain/transaction_model.dart';

/// Détermine l'opérateur téléphonique à partir d'un numéro
OperatorType detecterOperateur(String telephone) {
  // Supprime tous les espaces ou caractères spéciaux
  final cleanNumber = telephone.replaceAll(RegExp(r'\s+|-|\+'), '');

  // Extraction des 9 derniers chiffres (format local sans indicatif pays)
  String localNumber = cleanNumber;
  if (cleanNumber.length > 9) {
    localNumber = cleanNumber.substring(cleanNumber.length - 9);
  }

  if (localNumber.length < 9) {
    return OperatorType.UNKNOWN; // Ou la valeur par défaut de ton Enum
  }

  // Préfixes MTN Cameroun : 67, 650-654, 680-683
  if (RegExp(r'^(67|650|651|652|653|654|680|681|682|683)').hasMatch(localNumber)) {
    return OperatorType.MTN_MOMO;
  }

  // Préfixes Orange Cameroun : 69, 655-659, 685-689
  if (RegExp(r'^(69|655|656|657|658|659|685|686|687|688|689)').hasMatch(localNumber)) {
    return OperatorType.ORANGE_MONEY;
  }

  return OperatorType.UNKNOWN;
}