import 'package:drift/drift.dart';
import 'package:etoankopay/data/database/app_database.dart';
import 'package:etoankopay/data/repository/utilisateur_repository.dart';
import 'package:etoankopay/domain/utilisateur.dart';
import 'package:etoankopay/securite/hasher_mot_de_passe.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SqliteUtilisateurRepositoryImpl implements UtilisateurRepository {
  final AppDatabase db;

  SqliteUtilisateurRepositoryImpl(this.db);

  @override
  Future<Utilisateur?> authentifier(String email, String motDePasse) async {
    final query = db.select(db.utilisateurTable)
      ..where((u) => u.email.equals(email));
    
    final user= await query.getSingleOrNull();
    if (user == null) return null;
    print("\n \n \n \n \n VOICI L'UTILISATEUR $user\n \n \n \n \n");

    final bool estValide = HasherMotDePasse.verifierMotDePasse(
      motDePasse,
      user.motDePasse
    );

    if(estValide==true){
      return Utilisateur(
        nom: user.nom,
        email: user.email,
        telephone: user.telephone,
        motDePasse: user.motDePasse,
        codePin: user.codePin,
        conditionGenerale: user.conditionGenerale,
        solde: user.solde,
      );
    }
    return null;
  }

  Future<void> ajouterUtilisateur(Utilisateur user) async {
    await db.into(db.utilisateurTable).insert(
      UtilisateurTableCompanion.insert(
        telephone: user.telephone,
        nom: user.nom,
        email: user.email,
        motDePasse: HasherMotDePasse.hasherMotDePasse(user.motDePasse),
        codePin: HasherMotDePasse.hasherMotDePasse(user.codePin),
        conditionGenerale: Value(user.conditionGenerale),
        solde: Value(user.solde),
      ),
    );
  }


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