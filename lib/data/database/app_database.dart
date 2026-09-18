import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:etoankopay/data/database/table/transaction_table.dart';
import 'package:etoankopay/data/database/table/utilisateur_table.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'app_database.g.dart';

@DriftDatabase(tables:[UtilisateurTable,TransactionTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase():super(_openConnection());

  @override
  int get schemaVersion => 1;
}
LazyDatabase _openConnection(){
  return LazyDatabase(()async{
    final dbFolder = await getApplicationDocumentsDirectory();
    final file =File(p.join(dbFolder.path,'etoankopay.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
final appDatabaseProvider = Provider<AppDatabase>((ref) => AppDatabase());
