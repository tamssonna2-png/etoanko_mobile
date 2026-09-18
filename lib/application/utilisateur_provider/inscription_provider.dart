import 'package:etoankopay/application/utilisateur_provider/connexion_provider.dart';
import 'package:etoankopay/data/repository/sql/sqlite_utilisateur_repositoryImpl.dart';
import 'package:etoankopay/domain/utilisateur.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class UtilisateurInscriptionNotifier extends AsyncNotifier<List<Utilisateur>>{
  @override
  Future<List<Utilisateur> >build() async{
    
    final repo = ref.read(utilisateurRepositoryProvider);
    return await repo.getAllUtilisateur();
  }

  Future<void> inscrireUtilisateur(Utilisateur utilisateur)async{
    final repo = ref.read(utilisateurRepositoryProvider);
    await repo.ajouterUtilisateur(utilisateur);

    state =AsyncValue.data(await repo.getAllUtilisateur());
    ref.read(utilisateurConnecteProvider.notifier).forcerConnexion(utilisateur);
  }
  

}

final utilisateurNotifierProvider = AsyncNotifierProvider<UtilisateurInscriptionNotifier,List<Utilisateur>>((){
  return UtilisateurInscriptionNotifier();
});