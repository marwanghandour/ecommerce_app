import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository {
  final SupabaseClient supabaseClient;

  AuthRepository(this.supabaseClient);

  // Sign Up
  Future<String?> signUp(String email, String password) async {
    try {
      final response = await supabaseClient.auth.signUp(
        email: email,
        password: password,
      );
      if (response.session == null || response.user == null) {
        return 'Sign Up Failed: No session or user returned';
      }
      return null;
    } catch (e) {
      return 'Sign Up Failed: $e';
    }
  }

  // Log In
  Future<String?> logIn(String email, String password) async {
    try {
      final response = await supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (response.session == null || response.user == null) {
        return 'Login Failed: No session or user returned';
      }
      return null;
    } catch (e) {
      return 'Login Failed: $e';
    }
  }

  // Log Out
  Future<String?> logOut() async {
    try {
      await supabaseClient.auth.signOut();
      return null;
    } catch (e) {
      return 'Logout Failed: $e';
    }
  }
}
