import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/Auth.dart';

class AuthService extends GetxService {
  static final _supabase = Supabase.instance;
  static final error = false;

  Future signUp(String email, String password, String name, String phone,
      String role, cityId, provinceId, String telegram) async {
    try {
      final AuthResponse res = await _supabase.client.auth.signUp(
        email: email,
        password: password,
        data: {
          'full_name': name,
          'phone': phone,
          'role': role,
          'city_id': cityId,
          'province_id': provinceId,
          'telegarm': telegram,
        },
      );
      final Session? session = res.session;
      final User? user = res.user;
      final e = res.user;
      if (user != null) {
        return user.id;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
  }

  Future signIn(String email, String password) async {
    final response = await _supabase.client.auth
        .signInWithPassword(email: email, password: password);
    final Session? session = response.session;
    final User? user = response.user;
    if (user != null) {
      return user;
    } else {
      return null;
    }
  }

  //Update Porfile

  Future<void> updatePorfile(String name, String phone, String role,
      String cityId, String provinceId, String telegram) async {
    final userId = _supabase.client.auth.currentUser!.id;
    final data = await _supabase.client.from('porfiles').update({
      'full_name': name,
      'phone': phone,
      'role': role,
      'city_id': cityId,
      'province_id': provinceId,
      'telegarm': telegram,
    }).eq('id', userId);

    return data;
  }

  Future<void> insertPorfile(String name, String phone, String role,
      String cityId, String provinceId, String telegram) async {
    final userId = _supabase.client.auth.currentUser!.id;
    final data = await _supabase.client.from('porfiles').insert({
      'id': userId,
      'full_name': name,
      'phone': phone,
      'role': role,
      'city_id': cityId,
      'province_id': provinceId,
      'telegarm': telegram,
    });

    return data;
  }

  //signOut
  Future<dynamic> signOut() async {
    final response = await _supabase.client.auth.signOut();
    return response;
  }
}
