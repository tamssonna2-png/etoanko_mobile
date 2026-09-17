/*import 'package:drift/drift.dart';
import 'package:etoankopay/data/database/app_database.dart';
import 'package:etoankopay/data/repository/sql/sqlite_utilisateur_repositoryImpl.dart';
import 'package:etoankopay/domain/utilisateur.dart';
import 'package:etoankopay/securite/hasher_mot_de_passe.dart';

class InscriptionRepository extends SqliteUtilisateurRepositoryImpl{
  InscriptionRepository(super.db);
  
  @override
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
}
*/