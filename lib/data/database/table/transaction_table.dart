import 'package:drift/drift.dart';
import 'package:etoankopay/data/database/table/utilisateur_table.dart';

class TransactionTable extends Table{
  TextColumn get id => text()();
  TextColumn get reference => text()();
  TextColumn get utilisateurTelephone => text().references(UtilisateurTable, #telephone)();
  TextColumn get type => text()();
  RealColumn get montant => real()();
  RealColumn get frais => real()();
  TextColumn get operateurDest => text()();
  TextColumn get numeroDestinataire => text().nullable()();
  DateTimeColumn get date => dateTime()();
  TextColumn get statut => text()();

  @override
  Set<Column> get primaryKey => {id};
} 