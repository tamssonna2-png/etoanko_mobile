import 'package:etoankopay/domain/utilisateur.dart';

abstract class UtilisateurRepository {
  Future<List<Utilisateur>> getAllUtilisateur();
  Future<Utilisateur?> getUtilisateurParTelephone(String telephone);
  Future<Utilisateur?> authentifier(String email, String motDePasse);
  Future<void> ajouterUtilisateur(Utilisateur user);
  
}
