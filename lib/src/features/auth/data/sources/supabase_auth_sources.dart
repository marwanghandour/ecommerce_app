import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthSource {
  final SupabaseClient supabaseClient;

  SupabaseAuthSource(this.supabaseClient);

  Future<String> signIn(String email, String password) async {
    final response = await supabaseClient.auth.signInWithPassword(
      email: email,
      password: password,
    );

    if (response.session == null || response.user == null) {
      throw Exception('Failed to sign in. Please check your credentials and try again.');
    }
    return response.user!.email!;
  }

  Future<String> signUp(String email, String password) async {
    final response = await supabaseClient.auth.signUp(
      email: email,
      password: password,
    );

    if (response.session == null || response.user == null) {
      throw Exception('Failed to sign up. Please check your details and try again.');
    }
    return response.user!.email!;
  }

  Future<void> signOut() async {
    await supabaseClient.auth.signOut();
  }
}
