import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../utils/supabase_exception.dart';
import '../models/Auth.dart';

class AuthService extends GetxService {
  static final _supabase = Supabase.instance;
  static final error = false;

  Future<void> signUp() async {
    try {
      final AuthResponse res = await _supabase.client.auth.signUp(
        email: 'hassan@email.com',
        password: '123456',
      );
      final Session? session = res.session;
      final User? user = res.user;
    } catch (e) {}
  }

  Future<void> signIn(String email, String password) async {
    final response = await _supabase.client.auth
        .signInWithPassword(email: email, password: password);
    final Session? session = response.session;
    final User? user = response.user;
  }

  //signOut
  Future<void> signOut() async {
    final response = await _supabase.client.auth.signOut();
  }
}
