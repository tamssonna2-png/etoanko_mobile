/*import 'package:drift/drift.dart';
import 'package:etoankopay/data/repository/sql/sqlite_utilisateur_repositoryImpl.dart';
import 'package:etoankopay/domain/utilisateur.dart';
import 'package:etoankopay/securite/hasher_mot_de_passe.dart';

class ConnexionRepository extends SqliteUtilisateurRepositoryImpl{
  ConnexionRepository(super.db);

  @override
  Future<Utilisateur?> authentifier(String email, String motDePasse) async {
    final query = db.select(db.utilisateurTable)
      ..where((u) => u.email.equals(email) & u.motDePasse.equals(motDePasse));
    
    final user= await query.getSingleOrNull();
    if (user == null) return null;

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
}*/