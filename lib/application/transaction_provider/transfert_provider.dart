import 'package:etoankopay/data/constantes/constante.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:etoankopay/application/utilisateur_provider/connexion_provider.dart';
import 'package:etoankopay/data/repository/sql/sqlite_transaction_repository_impl.dart';
import 'package:etoankopay/domain/transaction_model.dart';
import 'package:etoankopay/domain/utilisateur.dart';
class TransfertNotifier extends Notifier<Utilisateur?> {
  static const double fraisTransfert = Constante.fraisTransfert; 

  @override
  Utilisateur? build() {
    return ref.watch(utilisateurConnecteProvider);
  }

  Future<bool> transferer({
    required double montant,
    required String destinataire,
    required OperatorType operateur,
  }) async {
    final userActuel = state;
    if (userActuel == null) return false;

    final repo = ref.read(transactionRepositoryProvider);

    // A. Appel du repository (Vérification solde, débit expéditeur, crédit destinataire)
    await repo.executerTransfert(
      utilisateurTelephone: userActuel.telephone,
      montant: montant,
      operateur: operateur,
      destinataire: destinataire,
    );

    // B. Log de contrôle dans la console
    if (repo is SqliteTransactionRepositoryImpl) {
      await repo.afficherLogsBaseDeDonnees();
    }

    // C. Calcul du nouveau solde local (Montant + 1% de frais)
    final double totalDebite = montant + (montant * fraisTransfert);
    final nouveauSolde = userActuel.solde - totalDebite;

    // D. Reconstitution de l'utilisateur avec son nouveau solde
    final userMisAJour = Utilisateur(
      nom: userActuel.nom,
      email: userActuel.email,
      telephone: userActuel.telephone,
      motDePasse: userActuel.motDePasse,
      codePin: userActuel.codePin,
      conditionGenerale: userActuel.conditionGenerale,
      solde: nouveauSolde,
    );

    // E. Mise à jour de l'état global
    state = userMisAJour;
    ref.read(utilisateurConnecteProvider.notifier).forcerConnexion(userMisAJour);

    return true;
  }
}

final transfertProvider = NotifierProvider<TransfertNotifier, Utilisateur?>(() {
  return TransfertNotifier();
});