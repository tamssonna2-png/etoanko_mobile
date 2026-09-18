enum TransactionType { RETRAIT, TRANSFERT,RECHARGE }
enum OperatorType { ORANGE_MONEY, MTN_MOMO, UNKNOWN}
enum TransactionStatus { PENDING, SUCCESS, FAILED }

class TransactionModel {
  final String id;
  final String reference;
  final String utilisateurTelephone;
  final TransactionType type;
  final double montant;
  final double frais;
  final OperatorType operateurDest;
  final String? numeroDestinataire;
  final DateTime date;
  final TransactionStatus statut;

  TransactionModel({
    required this.id,
    required this.reference,
    required this.utilisateurTelephone,
    required this.type,
    required this.montant,
    required this.frais,
    required this.operateurDest,
    this.numeroDestinataire,//ca peut etre nul si c'es un retrait donc j'ai enleve le required
    required this.date,
    required this.statut,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'reference': reference,
      'utilisateurId': utilisateurTelephone,
      'type': type.name,
      'montant': montant,
      'frais': frais,
      'operateurDest': operateurDest.name,
      'numeroDestinataire': numeroDestinataire,
      'date': date.toIso8601String(),
      'statut': statut.name,
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      id: map['id'],
      reference: map['reference'],
      utilisateurTelephone: map['utilisateurId'],
      type: TransactionType.values.byName(map['type']),
      montant: (map['montant'] as num).toDouble(),
      frais: (map['frais'] as num).toDouble(),
      operateurDest: OperatorType.values.byName(map['operateurDest']),
      numeroDestinataire: map['numeroDestinataire'],
      date: DateTime.parse(map['date']),
      statut: TransactionStatus.values.byName(map['statut']),
    );
  }

  Map<String, dynamic> toJson() => {
  'id': id,
  'reference': reference,
  'utilisateurTelephone': utilisateurTelephone,
  'numeroDestinataire': numeroDestinataire,
  'type': type.name,
  'montant': montant,
  'frais': frais,
  'operateurDest': operateurDest.name,
  'date': date.toIso8601String(),
  'statut': statut.name,
};

factory TransactionModel.fromJson(Map<String, dynamic> json) {
  return TransactionModel(
    id: json['id'],
    reference: json['reference'],
    utilisateurTelephone: json['utilisateurTelephone'],
    numeroDestinataire: json['numeroDestinataire'],
    type: TransactionType.values.byName(json['type']),
    montant: (json['montant'] as num).toDouble(),
    frais: (json['frais'] as num).toDouble(),
    operateurDest: OperatorType.values.byName(json['operateurDest']),
    date: DateTime.parse(json['date']),
    statut: TransactionStatus.values.byName(json['statut']),
  );
}
}