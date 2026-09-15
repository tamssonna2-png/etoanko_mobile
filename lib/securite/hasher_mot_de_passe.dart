import 'package:bcrypt/bcrypt.dart';

abstract class HasherMotDePasse {
  static String hasherMotDePasse(String motDePasse){
    return BCrypt.hashpw(motDePasse, BCrypt.gensalt());
  }


  static bool verifierMotDePasse(String motDePasseSaisie,String motDePasseHashe){
    try {
      return BCrypt.checkpw(motDePasseSaisie, motDePasseHashe);
    } catch (e) {
      return false;
    }
  }
}