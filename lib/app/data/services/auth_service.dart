import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../utils/supabase_exception.dart';
import '../models/Auth.dart';

class AuthService extends GetxService {
  static final _supabase = Supabase.instance;
  static final error = false;

  Future signUp(String email, String password) async {
    try {
      final AuthResponse res = await _supabase.client.auth.signUp(
        email: email,
        password: password,
      );
      final Session? session = res.session;
      final User? user = res.user;
      return user;
    } catch (e) {}
  }

  Future<void> signIn(String email, String password) async {
    final response = await _supabase.client.auth
        .signInWithPassword(email: email, password: password);
    final Session? session = response.session;
    final User? user = response.user;
  }

  //Update Porfile

  Future<void> updatePorfile(String id, String name, String phone, String role,
      String cityId, String provinceId, String telegram) async {
    final data = await _supabase.client.from('porfiles').update({
      'full_name': name,
      'phone': phone,
      'role': role,
      'city_id': cityId,
      'province_id': provinceId,
      'telegarm': telegram,
    }).eq('id', id);
  }

  //signOut
  Future<void> signOut() async {
    final response = await _supabase.client.auth.signOut();
  }
}
