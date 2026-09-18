// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UtilisateurTableTable extends UtilisateurTable
    with TableInfo<$UtilisateurTableTable, UtilisateurTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UtilisateurTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _telephoneMeta = const VerificationMeta(
    'telephone',
  );
  @override
  late final GeneratedColumn<String> telephone = GeneratedColumn<String>(
    'telephone',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nomMeta = const VerificationMeta('nom');
  @override
  late final GeneratedColumn<String> nom = GeneratedColumn<String>(
    'nom',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _motDePasseMeta = const VerificationMeta(
    'motDePasse',
  );
  @override
  late final GeneratedColumn<String> motDePasse = GeneratedColumn<String>(
    'mot_de_passe',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _codePinMeta = const VerificationMeta(
    'codePin',
  );
  @override
  late final GeneratedColumn<String> codePin = GeneratedColumn<String>(
    'code_pin',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _conditionGeneraleMeta = const VerificationMeta(
    'conditionGenerale',
  );
  @override
  late final GeneratedColumn<bool> conditionGenerale = GeneratedColumn<bool>(
    'condition_generale',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("condition_generale" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _soldeMeta = const VerificationMeta('solde');
  @override
  late final GeneratedColumn<double> solde = GeneratedColumn<double>(
    'solde',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    telephone,
    nom,
    email,
    motDePasse,
    codePin,
    conditionGenerale,
    solde,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'utilisateur_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<UtilisateurTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('telephone')) {
      context.handle(
        _telephoneMeta,
        telephone.isAcceptableOrUnknown(data['telephone']!, _telephoneMeta),
      );
    } else if (isInserting) {
      context.missing(_telephoneMeta);
    }
    if (data.containsKey('nom')) {
      context.handle(
        _nomMeta,
        nom.isAcceptableOrUnknown(data['nom']!, _nomMeta),
      );
    } else if (isInserting) {
      context.missing(_nomMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('mot_de_passe')) {
      context.handle(
        _motDePasseMeta,
        motDePasse.isAcceptableOrUnknown(
          data['mot_de_passe']!,
          _motDePasseMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_motDePasseMeta);
    }
    if (data.containsKey('code_pin')) {
      context.handle(
        _codePinMeta,
        codePin.isAcceptableOrUnknown(data['code_pin']!, _codePinMeta),
      );
    } else if (isInserting) {
      context.missing(_codePinMeta);
    }
    if (data.containsKey('condition_generale')) {
      context.handle(
        _conditionGeneraleMeta,
        conditionGenerale.isAcceptableOrUnknown(
          data['condition_generale']!,
          _conditionGeneraleMeta,
        ),
      );
    }
    if (data.containsKey('solde')) {
      context.handle(
        _soldeMeta,
        solde.isAcceptableOrUnknown(data['solde']!, _soldeMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {telephone};
  @override
  UtilisateurTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UtilisateurTableData(
      telephone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}telephone'],
      )!,
      nom: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nom'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
      motDePasse: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mot_de_passe'],
      )!,
      codePin: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code_pin'],
      )!,
      conditionGenerale: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}condition_generale'],
      )!,
      solde: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}solde'],
      )!,
    );
  }

  @override
  $UtilisateurTableTable createAlias(String alias) {
    return $UtilisateurTableTable(attachedDatabase, alias);
  }
}

class UtilisateurTableData extends DataClass
    implements Insertable<UtilisateurTableData> {
  final String telephone;
  final String nom;
  final String email;
  final String motDePasse;
  final String codePin;
  final bool conditionGenerale;
  final double solde;
  const UtilisateurTableData({
    required this.telephone,
    required this.nom,
    required this.email,
    required this.motDePasse,
    required this.codePin,
    required this.conditionGenerale,
    required this.solde,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['telephone'] = Variable<String>(telephone);
    map['nom'] = Variable<String>(nom);
    map['email'] = Variable<String>(email);
    map['mot_de_passe'] = Variable<String>(motDePasse);
    map['code_pin'] = Variable<String>(codePin);
    map['condition_generale'] = Variable<bool>(conditionGenerale);
    map['solde'] = Variable<double>(solde);
    return map;
  }

  UtilisateurTableCompanion toCompanion(bool nullToAbsent) {
    return UtilisateurTableCompanion(
      telephone: Value(telephone),
      nom: Value(nom),
      email: Value(email),
      motDePasse: Value(motDePasse),
      codePin: Value(codePin),
      conditionGenerale: Value(conditionGenerale),
      solde: Value(solde),
    );
  }

  factory UtilisateurTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UtilisateurTableData(
      telephone: serializer.fromJson<String>(json['telephone']),
      nom: serializer.fromJson<String>(json['nom']),
      email: serializer.fromJson<String>(json['email']),
      motDePasse: serializer.fromJson<String>(json['motDePasse']),
      codePin: serializer.fromJson<String>(json['codePin']),
      conditionGenerale: serializer.fromJson<bool>(json['conditionGenerale']),
      solde: serializer.fromJson<double>(json['solde']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'telephone': serializer.toJson<String>(telephone),
      'nom': serializer.toJson<String>(nom),
      'email': serializer.toJson<String>(email),
      'motDePasse': serializer.toJson<String>(motDePasse),
      'codePin': serializer.toJson<String>(codePin),
      'conditionGenerale': serializer.toJson<bool>(conditionGenerale),
      'solde': serializer.toJson<double>(solde),
    };
  }

  UtilisateurTableData copyWith({
    String? telephone,
    String? nom,
    String? email,
    String? motDePasse,
    String? codePin,
    bool? conditionGenerale,
    double? solde,
  }) => UtilisateurTableData(
    telephone: telephone ?? this.telephone,
    nom: nom ?? this.nom,
    email: email ?? this.email,
    motDePasse: motDePasse ?? this.motDePasse,
    codePin: codePin ?? this.codePin,
    conditionGenerale: conditionGenerale ?? this.conditionGenerale,
    solde: solde ?? this.solde,
  );
  UtilisateurTableData copyWithCompanion(UtilisateurTableCompanion data) {
    return UtilisateurTableData(
      telephone: data.telephone.present ? data.telephone.value : this.telephone,
      nom: data.nom.present ? data.nom.value : this.nom,
      email: data.email.present ? data.email.value : this.email,
      motDePasse: data.motDePasse.present
          ? data.motDePasse.value
          : this.motDePasse,
      codePin: data.codePin.present ? data.codePin.value : this.codePin,
      conditionGenerale: data.conditionGenerale.present
          ? data.conditionGenerale.value
          : this.conditionGenerale,
      solde: data.solde.present ? data.solde.value : this.solde,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UtilisateurTableData(')
          ..write('telephone: $telephone, ')
          ..write('nom: $nom, ')
          ..write('email: $email, ')
          ..write('motDePasse: $motDePasse, ')
          ..write('codePin: $codePin, ')
          ..write('conditionGenerale: $conditionGenerale, ')
          ..write('solde: $solde')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    telephone,
    nom,
    email,
    motDePasse,
    codePin,
    conditionGenerale,
    solde,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UtilisateurTableData &&
          other.telephone == this.telephone &&
          other.nom == this.nom &&
          other.email == this.email &&
          other.motDePasse == this.motDePasse &&
          other.codePin == this.codePin &&
          other.conditionGenerale == this.conditionGenerale &&
          other.solde == this.solde);
}

class UtilisateurTableCompanion extends UpdateCompanion<UtilisateurTableData> {
  final Value<String> telephone;
  final Value<String> nom;
  final Value<String> email;
  final Value<String> motDePasse;
  final Value<String> codePin;
  final Value<bool> conditionGenerale;
  final Value<double> solde;
  final Value<int> rowid;
  const UtilisateurTableCompanion({
    this.telephone = const Value.absent(),
    this.nom = const Value.absent(),
    this.email = const Value.absent(),
    this.motDePasse = const Value.absent(),
    this.codePin = const Value.absent(),
    this.conditionGenerale = const Value.absent(),
    this.solde = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UtilisateurTableCompanion.insert({
    required String telephone,
    required String nom,
    required String email,
    required String motDePasse,
    required String codePin,
    this.conditionGenerale = const Value.absent(),
    this.solde = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : telephone = Value(telephone),
       nom = Value(nom),
       email = Value(email),
       motDePasse = Value(motDePasse),
       codePin = Value(codePin);
  static Insertable<UtilisateurTableData> custom({
    Expression<String>? telephone,
    Expression<String>? nom,
    Expression<String>? email,
    Expression<String>? motDePasse,
    Expression<String>? codePin,
    Expression<bool>? conditionGenerale,
    Expression<double>? solde,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (telephone != null) 'telephone': telephone,
      if (nom != null) 'nom': nom,
      if (email != null) 'email': email,
      if (motDePasse != null) 'mot_de_passe': motDePasse,
      if (codePin != null) 'code_pin': codePin,
      if (conditionGenerale != null) 'condition_generale': conditionGenerale,
      if (solde != null) 'solde': solde,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UtilisateurTableCompanion copyWith({
    Value<String>? telephone,
    Value<String>? nom,
    Value<String>? email,
    Value<String>? motDePasse,
    Value<String>? codePin,
    Value<bool>? conditionGenerale,
    Value<double>? solde,
    Value<int>? rowid,
  }) {
    return UtilisateurTableCompanion(
      telephone: telephone ?? this.telephone,
      nom: nom ?? this.nom,
      email: email ?? this.email,
      motDePasse: motDePasse ?? this.motDePasse,
      codePin: codePin ?? this.codePin,
      conditionGenerale: conditionGenerale ?? this.conditionGenerale,
      solde: solde ?? this.solde,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (telephone.present) {
      map['telephone'] = Variable<String>(telephone.value);
    }
    if (nom.present) {
      map['nom'] = Variable<String>(nom.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (motDePasse.present) {
      map['mot_de_passe'] = Variable<String>(motDePasse.value);
    }
    if (codePin.present) {
      map['code_pin'] = Variable<String>(codePin.value);
    }
    if (conditionGenerale.present) {
      map['condition_generale'] = Variable<bool>(conditionGenerale.value);
    }
    if (solde.present) {
      map['solde'] = Variable<double>(solde.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UtilisateurTableCompanion(')
          ..write('telephone: $telephone, ')
          ..write('nom: $nom, ')
          ..write('email: $email, ')
          ..write('motDePasse: $motDePasse, ')
          ..write('codePin: $codePin, ')
          ..write('conditionGenerale: $conditionGenerale, ')
          ..write('solde: $solde, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TransactionTableTable extends TransactionTable
    with TableInfo<$TransactionTableTable, TransactionTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _referenceMeta = const VerificationMeta(
    'reference',
  );
  @override
  late final GeneratedColumn<String> reference = GeneratedColumn<String>(
    'reference',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _utilisateurTelephoneMeta =
      const VerificationMeta('utilisateurTelephone');
  @override
  late final GeneratedColumn<String> utilisateurTelephone =
      GeneratedColumn<String>(
        'utilisateur_telephone',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES utilisateur_table (telephone)',
        ),
      );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _montantMeta = const VerificationMeta(
    'montant',
  );
  @override
  late final GeneratedColumn<double> montant = GeneratedColumn<double>(
    'montant',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fraisMeta = const VerificationMeta('frais');
  @override
  late final GeneratedColumn<double> frais = GeneratedColumn<double>(
    'frais',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _operateurDestMeta = const VerificationMeta(
    'operateurDest',
  );
  @override
  late final GeneratedColumn<String> operateurDest = GeneratedColumn<String>(
    'operateur_dest',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _numeroDestinataireMeta =
      const VerificationMeta('numeroDestinataire');
  @override
  late final GeneratedColumn<String> numeroDestinataire =
      GeneratedColumn<String>(
        'numero_destinataire',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statutMeta = const VerificationMeta('statut');
  @override
  late final GeneratedColumn<String> statut = GeneratedColumn<String>(
    'statut',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    reference,
    utilisateurTelephone,
    type,
    montant,
    frais,
    operateurDest,
    numeroDestinataire,
    date,
    statut,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transaction_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<TransactionTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('reference')) {
      context.handle(
        _referenceMeta,
        reference.isAcceptableOrUnknown(data['reference']!, _referenceMeta),
      );
    } else if (isInserting) {
      context.missing(_referenceMeta);
    }
    if (data.containsKey('utilisateur_telephone')) {
      context.handle(
        _utilisateurTelephoneMeta,
        utilisateurTelephone.isAcceptableOrUnknown(
          data['utilisateur_telephone']!,
          _utilisateurTelephoneMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_utilisateurTelephoneMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('montant')) {
      context.handle(
        _montantMeta,
        montant.isAcceptableOrUnknown(data['montant']!, _montantMeta),
      );
    } else if (isInserting) {
      context.missing(_montantMeta);
    }
    if (data.containsKey('frais')) {
      context.handle(
        _fraisMeta,
        frais.isAcceptableOrUnknown(data['frais']!, _fraisMeta),
      );
    } else if (isInserting) {
      context.missing(_fraisMeta);
    }
    if (data.containsKey('operateur_dest')) {
      context.handle(
        _operateurDestMeta,
        operateurDest.isAcceptableOrUnknown(
          data['operateur_dest']!,
          _operateurDestMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_operateurDestMeta);
    }
    if (data.containsKey('numero_destinataire')) {
      context.handle(
        _numeroDestinataireMeta,
        numeroDestinataire.isAcceptableOrUnknown(
          data['numero_destinataire']!,
          _numeroDestinataireMeta,
        ),
      );
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('statut')) {
      context.handle(
        _statutMeta,
        statut.isAcceptableOrUnknown(data['statut']!, _statutMeta),
      );
    } else if (isInserting) {
      context.missing(_statutMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TransactionTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      reference: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reference'],
      )!,
      utilisateurTelephone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}utilisateur_telephone'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      montant: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}montant'],
      )!,
      frais: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}frais'],
      )!,
      operateurDest: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}operateur_dest'],
      )!,
      numeroDestinataire: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}numero_destinataire'],
      ),
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      statut: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}statut'],
      )!,
    );
  }

  @override
  $TransactionTableTable createAlias(String alias) {
    return $TransactionTableTable(attachedDatabase, alias);
  }
}

class TransactionTableData extends DataClass
    implements Insertable<TransactionTableData> {
  final String id;
  final String reference;
  final String utilisateurTelephone;
  final String type;
  final double montant;
  final double frais;
  final String operateurDest;
  final String? numeroDestinataire;
  final DateTime date;
  final String statut;
  const TransactionTableData({
    required this.id,
    required this.reference,
    required this.utilisateurTelephone,
    required this.type,
    required this.montant,
    required this.frais,
    required this.operateurDest,
    this.numeroDestinataire,
    required this.date,
    required this.statut,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['reference'] = Variable<String>(reference);
    map['utilisateur_telephone'] = Variable<String>(utilisateurTelephone);
    map['type'] = Variable<String>(type);
    map['montant'] = Variable<double>(montant);
    map['frais'] = Variable<double>(frais);
    map['operateur_dest'] = Variable<String>(operateurDest);
    if (!nullToAbsent || numeroDestinataire != null) {
      map['numero_destinataire'] = Variable<String>(numeroDestinataire);
    }
    map['date'] = Variable<DateTime>(date);
    map['statut'] = Variable<String>(statut);
    return map;
  }

  TransactionTableCompanion toCompanion(bool nullToAbsent) {
    return TransactionTableCompanion(
      id: Value(id),
      reference: Value(reference),
      utilisateurTelephone: Value(utilisateurTelephone),
      type: Value(type),
      montant: Value(montant),
      frais: Value(frais),
      operateurDest: Value(operateurDest),
      numeroDestinataire: numeroDestinataire == null && nullToAbsent
          ? const Value.absent()
          : Value(numeroDestinataire),
      date: Value(date),
      statut: Value(statut),
    );
  }

  factory TransactionTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionTableData(
      id: serializer.fromJson<String>(json['id']),
      reference: serializer.fromJson<String>(json['reference']),
      utilisateurTelephone: serializer.fromJson<String>(
        json['utilisateurTelephone'],
      ),
      type: serializer.fromJson<String>(json['type']),
      montant: serializer.fromJson<double>(json['montant']),
      frais: serializer.fromJson<double>(json['frais']),
      operateurDest: serializer.fromJson<String>(json['operateurDest']),
      numeroDestinataire: serializer.fromJson<String?>(
        json['numeroDestinataire'],
      ),
      date: serializer.fromJson<DateTime>(json['date']),
      statut: serializer.fromJson<String>(json['statut']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'reference': serializer.toJson<String>(reference),
      'utilisateurTelephone': serializer.toJson<String>(utilisateurTelephone),
      'type': serializer.toJson<String>(type),
      'montant': serializer.toJson<double>(montant),
      'frais': serializer.toJson<double>(frais),
      'operateurDest': serializer.toJson<String>(operateurDest),
      'numeroDestinataire': serializer.toJson<String?>(numeroDestinataire),
      'date': serializer.toJson<DateTime>(date),
      'statut': serializer.toJson<String>(statut),
    };
  }

  TransactionTableData copyWith({
    String? id,
    String? reference,
    String? utilisateurTelephone,
    String? type,
    double? montant,
    double? frais,
    String? operateurDest,
    Value<String?> numeroDestinataire = const Value.absent(),
    DateTime? date,
    String? statut,
  }) => TransactionTableData(
    id: id ?? this.id,
    reference: reference ?? this.reference,
    utilisateurTelephone: utilisateurTelephone ?? this.utilisateurTelephone,
    type: type ?? this.type,
    montant: montant ?? this.montant,
    frais: frais ?? this.frais,
    operateurDest: operateurDest ?? this.operateurDest,
    numeroDestinataire: numeroDestinataire.present
        ? numeroDestinataire.value
        : this.numeroDestinataire,
    date: date ?? this.date,
    statut: statut ?? this.statut,
  );
  TransactionTableData copyWithCompanion(TransactionTableCompanion data) {
    return TransactionTableData(
      id: data.id.present ? data.id.value : this.id,
      reference: data.reference.present ? data.reference.value : this.reference,
      utilisateurTelephone: data.utilisateurTelephone.present
          ? data.utilisateurTelephone.value
          : this.utilisateurTelephone,
      type: data.type.present ? data.type.value : this.type,
      montant: data.montant.present ? data.montant.value : this.montant,
      frais: data.frais.present ? data.frais.value : this.frais,
      operateurDest: data.operateurDest.present
          ? data.operateurDest.value
          : this.operateurDest,
      numeroDestinataire: data.numeroDestinataire.present
          ? data.numeroDestinataire.value
          : this.numeroDestinataire,
      date: data.date.present ? data.date.value : this.date,
      statut: data.statut.present ? data.statut.value : this.statut,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionTableData(')
          ..write('id: $id, ')
          ..write('reference: $reference, ')
          ..write('utilisateurTelephone: $utilisateurTelephone, ')
          ..write('type: $type, ')
          ..write('montant: $montant, ')
          ..write('frais: $frais, ')
          ..write('operateurDest: $operateurDest, ')
          ..write('numeroDestinataire: $numeroDestinataire, ')
          ..write('date: $date, ')
          ..write('statut: $statut')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    reference,
    utilisateurTelephone,
    type,
    montant,
    frais,
    operateurDest,
    numeroDestinataire,
    date,
    statut,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionTableData &&
          other.id == this.id &&
          other.reference == this.reference &&
          other.utilisateurTelephone == this.utilisateurTelephone &&
          other.type == this.type &&
          other.montant == this.montant &&
          other.frais == this.frais &&
          other.operateurDest == this.operateurDest &&
          other.numeroDestinataire == this.numeroDestinataire &&
          other.date == this.date &&
          other.statut == this.statut);
}

class TransactionTableCompanion extends UpdateCompanion<TransactionTableData> {
  final Value<String> id;
  final Value<String> reference;
  final Value<String> utilisateurTelephone;
  final Value<String> type;
  final Value<double> montant;
  final Value<double> frais;
  final Value<String> operateurDest;
  final Value<String?> numeroDestinataire;
  final Value<DateTime> date;
  final Value<String> statut;
  final Value<int> rowid;
  const TransactionTableCompanion({
    this.id = const Value.absent(),
    this.reference = const Value.absent(),
    this.utilisateurTelephone = const Value.absent(),
    this.type = const Value.absent(),
    this.montant = const Value.absent(),
    this.frais = const Value.absent(),
    this.operateurDest = const Value.absent(),
    this.numeroDestinataire = const Value.absent(),
    this.date = const Value.absent(),
    this.statut = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TransactionTableCompanion.insert({
    required String id,
    required String reference,
    required String utilisateurTelephone,
    required String type,
    required double montant,
    required double frais,
    required String operateurDest,
    this.numeroDestinataire = const Value.absent(),
    required DateTime date,
    required String statut,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       reference = Value(reference),
       utilisateurTelephone = Value(utilisateurTelephone),
       type = Value(type),
       montant = Value(montant),
       frais = Value(frais),
       operateurDest = Value(operateurDest),
       date = Value(date),
       statut = Value(statut);
  static Insertable<TransactionTableData> custom({
    Expression<String>? id,
    Expression<String>? reference,
    Expression<String>? utilisateurTelephone,
    Expression<String>? type,
    Expression<double>? montant,
    Expression<double>? frais,
    Expression<String>? operateurDest,
    Expression<String>? numeroDestinataire,
    Expression<DateTime>? date,
    Expression<String>? statut,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (reference != null) 'reference': reference,
      if (utilisateurTelephone != null)
        'utilisateur_telephone': utilisateurTelephone,
      if (type != null) 'type': type,
      if (montant != null) 'montant': montant,
      if (frais != null) 'frais': frais,
      if (operateurDest != null) 'operateur_dest': operateurDest,
      if (numeroDestinataire != null) 'numero_destinataire': numeroDestinataire,
      if (date != null) 'date': date,
      if (statut != null) 'statut': statut,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TransactionTableCompanion copyWith({
    Value<String>? id,
    Value<String>? reference,
    Value<String>? utilisateurTelephone,
    Value<String>? type,
    Value<double>? montant,
    Value<double>? frais,
    Value<String>? operateurDest,
    Value<String?>? numeroDestinataire,
    Value<DateTime>? date,
    Value<String>? statut,
    Value<int>? rowid,
  }) {
    return TransactionTableCompanion(
      id: id ?? this.id,
      reference: reference ?? this.reference,
      utilisateurTelephone: utilisateurTelephone ?? this.utilisateurTelephone,
      type: type ?? this.type,
      montant: montant ?? this.montant,
      frais: frais ?? this.frais,
      operateurDest: operateurDest ?? this.operateurDest,
      numeroDestinataire: numeroDestinataire ?? this.numeroDestinataire,
      date: date ?? this.date,
      statut: statut ?? this.statut,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (reference.present) {
      map['reference'] = Variable<String>(reference.value);
    }
    if (utilisateurTelephone.present) {
      map['utilisateur_telephone'] = Variable<String>(
        utilisateurTelephone.value,
      );
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (montant.present) {
      map['montant'] = Variable<double>(montant.value);
    }
    if (frais.present) {
      map['frais'] = Variable<double>(frais.value);
    }
    if (operateurDest.present) {
      map['operateur_dest'] = Variable<String>(operateurDest.value);
    }
    if (numeroDestinataire.present) {
      map['numero_destinataire'] = Variable<String>(numeroDestinataire.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (statut.present) {
      map['statut'] = Variable<String>(statut.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionTableCompanion(')
          ..write('id: $id, ')
          ..write('reference: $reference, ')
          ..write('utilisateurTelephone: $utilisateurTelephone, ')
          ..write('type: $type, ')
          ..write('montant: $montant, ')
          ..write('frais: $frais, ')
          ..write('operateurDest: $operateurDest, ')
          ..write('numeroDestinataire: $numeroDestinataire, ')
          ..write('date: $date, ')
          ..write('statut: $statut, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UtilisateurTableTable utilisateurTable = $UtilisateurTableTable(
    this,
  );
  late final $TransactionTableTable transactionTable = $TransactionTableTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    utilisateurTable,
    transactionTable,
  ];
}

typedef $$UtilisateurTableTableCreateCompanionBuilder =
    UtilisateurTableCompanion Function({
      required String telephone,
      required String nom,
      required String email,
      required String motDePasse,
      required String codePin,
      Value<bool> conditionGenerale,
      Value<double> solde,
      Value<int> rowid,
    });
typedef $$UtilisateurTableTableUpdateCompanionBuilder =
    UtilisateurTableCompanion Function({
      Value<String> telephone,
      Value<String> nom,
      Value<String> email,
      Value<String> motDePasse,
      Value<String> codePin,
      Value<bool> conditionGenerale,
      Value<double> solde,
      Value<int> rowid,
    });

final class $$UtilisateurTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $UtilisateurTableTable,
          UtilisateurTableData
        > {
  $$UtilisateurTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$TransactionTableTable, List<TransactionTableData>>
  _transactionTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.transactionTable,
    aliasName: 'utilisateur_table__telephone__transaction_table__utilisateur_telephone',
  );

  $$TransactionTableTableProcessedTableManager get transactionTableRefs {
    final manager =
        $$TransactionTableTableTableManager($_db, $_db.transactionTable).filter(
          (f) => f.utilisateurTelephone.telephone.sqlEquals(
            $_itemColumn<String>('telephone')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _transactionTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UtilisateurTableTableFilterComposer
    extends Composer<_$AppDatabase, $UtilisateurTableTable> {
  $$UtilisateurTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get telephone => $composableBuilder(
    column: $table.telephone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nom => $composableBuilder(
    column: $table.nom,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get motDePasse => $composableBuilder(
    column: $table.motDePasse,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get codePin => $composableBuilder(
    column: $table.codePin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get conditionGenerale => $composableBuilder(
    column: $table.conditionGenerale,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get solde => $composableBuilder(
    column: $table.solde,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> transactionTableRefs(
    Expression<bool> Function($$TransactionTableTableFilterComposer f) f,
  ) {
    final $$TransactionTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.telephone,
      referencedTable: $db.transactionTable,
      getReferencedColumn: (t) => t.utilisateurTelephone,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionTableTableFilterComposer(
            $db: $db,
            $table: $db.transactionTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UtilisateurTableTableOrderingComposer
    extends Composer<_$AppDatabase, $UtilisateurTableTable> {
  $$UtilisateurTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get telephone => $composableBuilder(
    column: $table.telephone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nom => $composableBuilder(
    column: $table.nom,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get motDePasse => $composableBuilder(
    column: $table.motDePasse,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get codePin => $composableBuilder(
    column: $table.codePin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get conditionGenerale => $composableBuilder(
    column: $table.conditionGenerale,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get solde => $composableBuilder(
    column: $table.solde,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UtilisateurTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $UtilisateurTableTable> {
  $$UtilisateurTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get telephone =>
      $composableBuilder(column: $table.telephone, builder: (column) => column);

  GeneratedColumn<String> get nom =>
      $composableBuilder(column: $table.nom, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get motDePasse => $composableBuilder(
    column: $table.motDePasse,
    builder: (column) => column,
  );

  GeneratedColumn<String> get codePin =>
      $composableBuilder(column: $table.codePin, builder: (column) => column);

  GeneratedColumn<bool> get conditionGenerale => $composableBuilder(
    column: $table.conditionGenerale,
    builder: (column) => column,
  );

  GeneratedColumn<double> get solde =>
      $composableBuilder(column: $table.solde, builder: (column) => column);

  Expression<T> transactionTableRefs<T extends Object>(
    Expression<T> Function($$TransactionTableTableAnnotationComposer a) f,
  ) {
    final $$TransactionTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.telephone,
      referencedTable: $db.transactionTable,
      getReferencedColumn: (t) => t.utilisateurTelephone,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionTableTableAnnotationComposer(
            $db: $db,
            $table: $db.transactionTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UtilisateurTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UtilisateurTableTable,
          UtilisateurTableData,
          $$UtilisateurTableTableFilterComposer,
          $$UtilisateurTableTableOrderingComposer,
          $$UtilisateurTableTableAnnotationComposer,
          $$UtilisateurTableTableCreateCompanionBuilder,
          $$UtilisateurTableTableUpdateCompanionBuilder,
          (UtilisateurTableData, $$UtilisateurTableTableReferences),
          UtilisateurTableData,
          PrefetchHooks Function({bool transactionTableRefs})
        > {
  $$UtilisateurTableTableTableManager(
    _$AppDatabase db,
    $UtilisateurTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UtilisateurTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UtilisateurTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UtilisateurTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> telephone = const Value.absent(),
                Value<String> nom = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<String> motDePasse = const Value.absent(),
                Value<String> codePin = const Value.absent(),
                Value<bool> conditionGenerale = const Value.absent(),
                Value<double> solde = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UtilisateurTableCompanion(
                telephone: telephone,
                nom: nom,
                email: email,
                motDePasse: motDePasse,
                codePin: codePin,
                conditionGenerale: conditionGenerale,
                solde: solde,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String telephone,
                required String nom,
                required String email,
                required String motDePasse,
                required String codePin,
                Value<bool> conditionGenerale = const Value.absent(),
                Value<double> solde = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UtilisateurTableCompanion.insert(
                telephone: telephone,
                nom: nom,
                email: email,
                motDePasse: motDePasse,
                codePin: codePin,
                conditionGenerale: conditionGenerale,
                solde: solde,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$UtilisateurTableTable, UtilisateurTableData>(
                    table,
                  ),
                  $$UtilisateurTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({transactionTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (transactionTableRefs) db.transactionTable,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (transactionTableRefs)
                    await $_getPrefetchedData<
                      UtilisateurTableData,
                      $UtilisateurTableTable,
                      TransactionTableData
                    >(
                      currentTable: table,
                      referencedTable: $$UtilisateurTableTableReferences
                          ._transactionTableRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$UtilisateurTableTableReferences(
                            db,
                            table,
                            p0,
                          ).transactionTableRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.utilisateurTelephone == item.telephone,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$UtilisateurTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UtilisateurTableTable,
      UtilisateurTableData,
      $$UtilisateurTableTableFilterComposer,
      $$UtilisateurTableTableOrderingComposer,
      $$UtilisateurTableTableAnnotationComposer,
      $$UtilisateurTableTableCreateCompanionBuilder,
      $$UtilisateurTableTableUpdateCompanionBuilder,
      (UtilisateurTableData, $$UtilisateurTableTableReferences),
      UtilisateurTableData,
      PrefetchHooks Function({bool transactionTableRefs})
    >;
typedef $$TransactionTableTableCreateCompanionBuilder =
    TransactionTableCompanion Function({
      required String id,
      required String reference,
      required String utilisateurTelephone,
      required String type,
      required double montant,
      required double frais,
      required String operateurDest,
      Value<String?> numeroDestinataire,
      required DateTime date,
      required String statut,
      Value<int> rowid,
    });
typedef $$TransactionTableTableUpdateCompanionBuilder =
    TransactionTableCompanion Function({
      Value<String> id,
      Value<String> reference,
      Value<String> utilisateurTelephone,
      Value<String> type,
      Value<double> montant,
      Value<double> frais,
      Value<String> operateurDest,
      Value<String?> numeroDestinataire,
      Value<DateTime> date,
      Value<String> statut,
      Value<int> rowid,
    });

final class $$TransactionTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $TransactionTableTable,
          TransactionTableData
        > {
  $$TransactionTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UtilisateurTableTable _utilisateurTelephoneTable(
    _$AppDatabase db,
  ) => db.utilisateurTable.createAlias(
    'transaction_table__utilisateur_telephone__utilisateur_table__telephone',
  );

  $$UtilisateurTableTableProcessedTableManager get utilisateurTelephone {
    final $_column = $_itemColumn<String>('utilisateur_telephone')!;

    final manager = $$UtilisateurTableTableTableManager(
      $_db,
      $_db.utilisateurTable,
    ).filter((f) => f.telephone.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(
      _utilisateurTelephoneTable($_db),
    );
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TransactionTableTableFilterComposer
    extends Composer<_$AppDatabase, $TransactionTableTable> {
  $$TransactionTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reference => $composableBuilder(
    column: $table.reference,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get montant => $composableBuilder(
    column: $table.montant,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get frais => $composableBuilder(
    column: $table.frais,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get operateurDest => $composableBuilder(
    column: $table.operateurDest,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get numeroDestinataire => $composableBuilder(
    column: $table.numeroDestinataire,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get statut => $composableBuilder(
    column: $table.statut,
    builder: (column) => ColumnFilters(column),
  );

  $$UtilisateurTableTableFilterComposer get utilisateurTelephone {
    final $$UtilisateurTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.utilisateurTelephone,
      referencedTable: $db.utilisateurTable,
      getReferencedColumn: (t) => t.telephone,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UtilisateurTableTableFilterComposer(
            $db: $db,
            $table: $db.utilisateurTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TransactionTableTableOrderingComposer
    extends Composer<_$AppDatabase, $TransactionTableTable> {
  $$TransactionTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reference => $composableBuilder(
    column: $table.reference,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get montant => $composableBuilder(
    column: $table.montant,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get frais => $composableBuilder(
    column: $table.frais,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get operateurDest => $composableBuilder(
    column: $table.operateurDest,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get numeroDestinataire => $composableBuilder(
    column: $table.numeroDestinataire,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get statut => $composableBuilder(
    column: $table.statut,
    builder: (column) => ColumnOrderings(column),
  );

  $$UtilisateurTableTableOrderingComposer get utilisateurTelephone {
    final $$UtilisateurTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.utilisateurTelephone,
      referencedTable: $db.utilisateurTable,
      getReferencedColumn: (t) => t.telephone,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UtilisateurTableTableOrderingComposer(
            $db: $db,
            $table: $db.utilisateurTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TransactionTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransactionTableTable> {
  $$TransactionTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get reference =>
      $composableBuilder(column: $table.reference, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<double> get montant =>
      $composableBuilder(column: $table.montant, builder: (column) => column);

  GeneratedColumn<double> get frais =>
      $composableBuilder(column: $table.frais, builder: (column) => column);

  GeneratedColumn<String> get operateurDest => $composableBuilder(
    column: $table.operateurDest,
    builder: (column) => column,
  );

  GeneratedColumn<String> get numeroDestinataire => $composableBuilder(
    column: $table.numeroDestinataire,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get statut =>
      $composableBuilder(column: $table.statut, builder: (column) => column);

  $$UtilisateurTableTableAnnotationComposer get utilisateurTelephone {
    final $$UtilisateurTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.utilisateurTelephone,
      referencedTable: $db.utilisateurTable,
      getReferencedColumn: (t) => t.telephone,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UtilisateurTableTableAnnotationComposer(
            $db: $db,
            $table: $db.utilisateurTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TransactionTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TransactionTableTable,
          TransactionTableData,
          $$TransactionTableTableFilterComposer,
          $$TransactionTableTableOrderingComposer,
          $$TransactionTableTableAnnotationComposer,
          $$TransactionTableTableCreateCompanionBuilder,
          $$TransactionTableTableUpdateCompanionBuilder,
          (TransactionTableData, $$TransactionTableTableReferences),
          TransactionTableData,
          PrefetchHooks Function({bool utilisateurTelephone})
        > {
  $$TransactionTableTableTableManager(
    _$AppDatabase db,
    $TransactionTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransactionTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TransactionTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TransactionTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> reference = const Value.absent(),
                Value<String> utilisateurTelephone = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<double> montant = const Value.absent(),
                Value<double> frais = const Value.absent(),
                Value<String> operateurDest = const Value.absent(),
                Value<String?> numeroDestinataire = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String> statut = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TransactionTableCompanion(
                id: id,
                reference: reference,
                utilisateurTelephone: utilisateurTelephone,
                type: type,
                montant: montant,
                frais: frais,
                operateurDest: operateurDest,
                numeroDestinataire: numeroDestinataire,
                date: date,
                statut: statut,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String reference,
                required String utilisateurTelephone,
                required String type,
                required double montant,
                required double frais,
                required String operateurDest,
                Value<String?> numeroDestinataire = const Value.absent(),
                required DateTime date,
                required String statut,
                Value<int> rowid = const Value.absent(),
              }) => TransactionTableCompanion.insert(
                id: id,
                reference: reference,
                utilisateurTelephone: utilisateurTelephone,
                type: type,
                montant: montant,
                frais: frais,
                operateurDest: operateurDest,
                numeroDestinataire: numeroDestinataire,
                date: date,
                statut: statut,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$TransactionTableTable, TransactionTableData>(
                    table,
                  ),
                  $$TransactionTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({utilisateurTelephone = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (utilisateurTelephone) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.utilisateurTelephone,
                        referencedTable: $$TransactionTableTableReferences
                            ._utilisateurTelephoneTable(db),
                        referencedColumn: $$TransactionTableTableReferences
                            ._utilisateurTelephoneTable(db)
                            .telephone,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$TransactionTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TransactionTableTable,
      TransactionTableData,
      $$TransactionTableTableFilterComposer,
      $$TransactionTableTableOrderingComposer,
      $$TransactionTableTableAnnotationComposer,
      $$TransactionTableTableCreateCompanionBuilder,
      $$TransactionTableTableUpdateCompanionBuilder,
      (TransactionTableData, $$TransactionTableTableReferences),
      TransactionTableData,
      PrefetchHooks Function({bool utilisateurTelephone})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UtilisateurTableTableTableManager get utilisateurTable =>
      $$UtilisateurTableTableTableManager(_db, _db.utilisateurTable);
  $$TransactionTableTableTableManager get transactionTable =>
      $$TransactionTableTableTableManager(_db, _db.transactionTable);
}
