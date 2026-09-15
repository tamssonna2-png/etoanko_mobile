import 'package:drift/drift.dart';

class UtilisateurTable extends Table{
  TextColumn get telephone => text()();
  TextColumn get nom => text()();
  TextColumn get email => text()();
  TextColumn get motDePasse => text()();
  TextColumn get codePin =>text()();
  BoolColumn get conditionGenerale => boolean().withDefault(const Constant(true))();
  RealColumn get solde =>real().withDefault(const Constant(0.0))();

  @override
  Set<Column> get primaryKey => {telephone};
}