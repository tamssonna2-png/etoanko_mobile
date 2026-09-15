import 'package:etoankopay/data/database/app_database.dart';
import 'package:etoankopay/data/repository/utilisateur_repository.dart';
import 'package:etoankopay/domain/utilisateur.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SqliteUtilisateurRepositoryImpl implements UtilisateurRepository {
  final AppDatabase db;

  SqliteUtilisateurRepositoryImpl(this.db);

  @override
  Future<void> ajouterUtilisateur(Utilisateur user)async{}

  @override
  Future<Utilisateur?> authentifier(String email, String motDePasse) async =>null;


  Utilisateur toDomain(UtilisateurTableData row) {
    return Utilisateur(
      nom: row.nom,
      email: row.email,
      telephone: row.telephone,
      motDePasse: row.motDePasse,
      codePin: row.codePin,
      conditionGenerale: row.conditionGenerale,
      solde: row.solde,
    );
  }

  @override
  Future<List<Utilisateur>> getAllUtilisateur() async {
    final rows = await db.select(db.utilisateurTable).get();
    return rows.map(toDomain).toList();
  }
  

  @override
  Future<Utilisateur?>getUtilisateurParTelephone(String telephone)async{
    final query = db.select(db.utilisateurTable)..where((u)=>u.telephone.equals(telephone));
    final row = await query.getSingleOrNull();

    if(row==null) return null;

    return Utilisateur(nom: row.nom, 
      email: row.email, 
      telephone: row.telephone, 
      motDePasse: row.motDePasse, 
      codePin: row.codePin, 
      conditionGenerale: row.conditionGenerale,
      solde: row.solde);
  }
}
final utilisateurRepositoryProvider = Provider<SqliteUtilisateurRepositoryImpl>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return SqliteUtilisateurRepositoryImpl(db);
});