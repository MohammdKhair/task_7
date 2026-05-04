import 'package:supabase_flutter/supabase_flutter.dart';

class AuthNotes {
  final supaAuth = Supabase.instance.client.auth;

  Future<AuthResponse> signUp(String email, String password) async {
    return await supaAuth.signUp(email: email, password: password);
  }

  Future<AuthResponse> signIn(String email, String password) async {
    return await supaAuth.signInWithPassword(email: email, password: password);
  }

  Future<void> signOut() async {
    return await supaAuth.signOut();
  }
}
