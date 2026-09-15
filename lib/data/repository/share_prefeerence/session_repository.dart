
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SessionRepository{
  final SharedPreferences prefs;
  static const String _cleSession ='session_active_email';
  SessionRepository(this.prefs);


  Future<void> sauvegarderSession(String email) async {
    await prefs.setString(_cleSession, email);
  }

  String? getSessionActive(){
    return prefs.getString(_cleSession);
  }

  Future<void>detruireSession(){
    return prefs.remove(_cleSession);
  }
  
}
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('Surcharger dans le main');
});

final sessionRepositoryProvider = Provider<SessionRepository>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return SessionRepository(prefs);
});
