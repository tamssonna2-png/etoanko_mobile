
// 1. Déclarer l'accès à la BDD SQLite
import 'package:etoankopay/application/utilisateur_provider/connexion_provider.dart';
import 'package:etoankopay/data/constantes/constante.dart';
import 'package:etoankopay/data/database/app_database.dart';
import 'package:etoankopay/data/repository/sql/sqlite_transaction_repository_impl.dart';
import 'package:etoankopay/domain/transaction_model.dart';
import 'package:etoankopay/domain/utilisateur.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

// 2. Déclarer le Repository SQLite


// 3. Le Notifier dédié UNIQUEMENT au Retrait
class RetraitNotifier extends Notifier<Utilisateur?> {
  final fraisRetrait = Constante.fraisRetrait;
  @override
  Utilisateur? build() {
    return ref.watch(utilisateurConnecteProvider);
  }

  Future<bool> retirer({
    required double montant,
    required OperatorType operateur,
  }) async {
    final userActuel = state;
    if (userActuel == null) return false;

    // A. Appelle le repository (qui vérifie le solde dans SQLite et débite)
    final repo = ref.read(transactionRepositoryProvider);
    await repo.executerRetrait(
      utilisateurTelephone: userActuel.telephone,
      montant: montant,
      operateur: operateur,
    );
    
    if (repo is SqliteTransactionRepositoryImpl) {
      await repo.afficherLogsBaseDeDonnees();
    }

    // B. Calcule le nouveau solde localement (Montant + 10% de frais)
    final double totalDebite = montant + (montant * fraisRetrait);
    final nouveauSolde = userActuel.solde - totalDebite;

    // C. Reconstruis l'utilisateur avec son nouveau solde
    final userMisAJour = Utilisateur(
      nom: userActuel.nom,
      email: userActuel.email,
      telephone: userActuel.telephone,
      motDePasse: userActuel.motDePasse,
      codePin: userActuel.codePin,
      conditionGenerale: userActuel.conditionGenerale,
      solde: nouveauSolde,
    );

    // D. Met à jour l'état de l'application
    state = userMisAJour;
    ref.read(utilisateurConnecteProvider.notifier).forcerConnexion(userMisAJour);

    return true;
  }
}

final retraitProvider = NotifierProvider<RetraitNotifier, Utilisateur?>(() {
  return RetraitNotifier();
});
