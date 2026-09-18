import 'package:etoankopay/data/repository/share_prefeerence/session_repository.dart';
import 'package:etoankopay/data/repository/sql/sqlite_utilisateur_repositoryImpl.dart';
import 'package:etoankopay/domain/utilisateur.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UtilisateurConnexionNotifier extends Notifier<Utilisateur?>{
  @override
  Utilisateur? build() {
    return null;
  }
  Future<bool> connexionUtilisateur(String email,String motDePasse)async{
    final repo= ref.read(utilisateurRepositoryProvider);
    await Future.delayed(Duration(seconds: 2));
    final utilisateurTrouve = await repo.authentifier(email, motDePasse);
    if(utilisateurTrouve!=null){
      ref.read(utilisateurConnecteProvider.notifier).forcerConnexion(utilisateurTrouve);
      return true;
    }
    return false;
  }

  Future<void> vereifierSessionActive()async{
    final repo = ref.read(sessionRepositoryProvider);
    final emailSauvegarde = repo.getSessionActive();
    if(emailSauvegarde!=null && emailSauvegarde.isNotEmpty){
      final listeUtilisateurs = ref.read(utilisateurRepositoryProvider);
      final utilisateurs = await listeUtilisateurs.getAllUtilisateur();
      try {
        state= utilisateurs.firstWhere(
          (u)=>u.email==emailSauvegarde);
      } catch (e) {
        state=null;
      }
    }
  }
  Future<bool> estConnecter(String email,String motDePasse)async{
    final repo = ref.read(utilisateurRepositoryProvider);
    final utilisateurTrouve = await repo.authentifier(email, motDePasse);
    if(utilisateurTrouve!=null){
      state = utilisateurTrouve;
      final sessionRepo = ref.read(sessionRepositoryProvider);
      await sessionRepo.sauvegarderSession(utilisateurTrouve.email);
      return true;
    }
    return false;
  }
  void forcerConnexion(Utilisateur utilisateur){
    state = utilisateur;
  }
  void seDeconnecter(){
    state=null;
    ref.read(sessionRepositoryProvider).detruireSession();
  }

}
final utilisateurConnecteProvider =
    NotifierProvider<UtilisateurConnexionNotifier, Utilisateur?>(() {
  return UtilisateurConnexionNotifier();
});