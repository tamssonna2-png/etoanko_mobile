import 'package:etoankopay/application/utilisateur_provider/connexion_provider.dart';
import 'package:etoankopay/data/repository/share_prefeerence/session_repository.dart';
import 'package:etoankopay/pages/page_identification/connexion.dart';
import 'package:etoankopay/pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  await dotenv.load(fileName: ".env");
  runApp(
     ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
      ],
      child: MyApp(),
    )
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  bool _estEnCoursDeVerification = true;

  @override
  void initState() {
    super.initState();
    _verifierSession();
  }

  Future<void> _verifierSession() async {
    await ref.read(utilisateurConnecteProvider.notifier).vereifierSessionActive();
    if (mounted) {
      setState(() {
        _estEnCoursDeVerification = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final utilisateurConnecte = ref.watch(utilisateurConnecteProvider);

    return MaterialApp(
      title: "EtoankoPay",
      home: _estEnCoursDeVerification
          ? const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : (utilisateurConnecte != null ? const Dashboard() : const Connexion()),
    );
  }
}