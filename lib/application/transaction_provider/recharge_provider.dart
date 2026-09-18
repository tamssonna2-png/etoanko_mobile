import 'package:etoankopay/application/utilisateur_provider/connexion_provider.dart';
import 'package:etoankopay/data/repository/sql/sqlite_transaction_repository_impl.dart';
import 'package:etoankopay/domain/transaction_model.dart';
import 'package:etoankopay/domain/utilisateur.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RechargeNotifier extends Notifier<Utilisateur?>{
  @override
  Utilisateur? build() {
    
    return ref.watch(utilisateurConnecteProvider);
  }

  Future<bool>recharger(double montant,OperatorType operateur)async{
    final utilisareurActuel = state;
    if(utilisareurActuel == null) return false;

    //final repo =ref.read(utilisateurRepositoryProvider);
    final repoTx = ref.read(transactionRepositoryProvider);
      await repoTx.executerRecharge(
        utilisateurTelephone: utilisareurActuel.telephone, 
        montant: montant, 
        operateur: operateur);
      utilisareurActuel.solde+=montant;

      state = Utilisateur(nom: utilisareurActuel.nom, 
      email: utilisareurActuel.email, 
      telephone: utilisareurActuel.telephone, 
      motDePasse: utilisareurActuel.motDePasse, 
      codePin: utilisareurActuel.codePin, 
      conditionGenerale: utilisareurActuel.conditionGenerale,
      solde: utilisareurActuel.solde
      );

      if(repoTx is SqliteTransactionRepositoryImpl) await repoTx.afficherLogsBaseDeDonnees();
      ref.read(utilisateurConnecteProvider.notifier).forcerConnexion(state!);
      //ref.read(transactionStateNotifierProvider.notifier).chargerHistorique(utilisareurActuel.telephone);
      return true;
   
  }



  // Dans ta classe UtilisateurConnecteNotifier (ou équivalent)
Future<void> reinitialiserSolde() async {
  final userActuel = state;
  if (userActuel == null) return;

  // 1. Réinitialiser en BDD
  final repoTx = ref.read(transactionRepositoryProvider);
  if (repoTx is SqliteTransactionRepositoryImpl) {
    await repoTx.reinitialiserSoldeBDD(userActuel.telephone);
  }

  // 2. Mettre à jour l'état local UI
  final userMisAJour = Utilisateur(
    nom: userActuel.nom,
    email: userActuel.email,
    telephone: userActuel.telephone,
    motDePasse: userActuel.motDePasse,
    codePin: userActuel.codePin,
    conditionGenerale: userActuel.conditionGenerale,
    solde: 0.0, // Solde remis à zéro
  );

  state = userMisAJour;
  ref.read(utilisateurConnecteProvider.notifier).forcerConnexion(state!);
  if(repoTx is SqliteTransactionRepositoryImpl) await repoTx.afficherLogsBaseDeDonnees();
}
}

class ModePaiementNotifier extends Notifier<String?>{
  @override
  String? build() {
    
    return null;
  }

  void changerMode(String? nouveauMode){
    state = nouveauMode;
  }

}

final rechargeProvider = NotifierProvider<RechargeNotifier,Utilisateur?>((){
  return RechargeNotifier();
});
final modePaiementSelectionneProvider =NotifierProvider<ModePaiementNotifier,String?>(ModePaiementNotifier.new);