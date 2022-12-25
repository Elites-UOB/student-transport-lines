import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/Auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class AuthService extends GetxService {
  Future<AuthService> init() async => this;
  final RxBool isAuthenticated = false.obs;

  static final _supabase = Supabase.instance;
  static final error = false;

  //check if user is authenticated

  void setIsAuthenticated(bool value) {
    isAuthenticated.value = value;
  }

  checkAuthentication() async {
    final user = _supabase.client.auth.currentUser;
    final session = _supabase.client.auth.currentSession;

    if (user != null && session != null) {
      final data = await _supabase.client
          .from('porfiles')
          .select('id,full_name,phone,role,city_id,province_id,telegarm')
          .eq('id', user.id)
          .single();

      final role = data['role'];
      print(role);
      setIsAuthenticated(true);
      if (role == null || role.isEmpty) {
        Get.offNamed('/role');
      } else if (role == 'driver') {
        Get.offNamed('/driver/home');
      } else if (role == 'student') {
        Get.offNamed('/student/home');
      }
    } else {
      setIsAuthenticated(false);
      Get.offNamed('/auth');
    }
  }

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
    try {
      final response = await _supabase.client.auth
          .signInWithPassword(email: email, password: password);
      final Session? session = response.session;
      final User? user = response.user;
      if (user != null) {
        return user.userMetadata;
      } else {
        return null;
      }
    } on AuthException catch (error) {
      return error;
    } catch (_) {
      return Exception('Error');
    }
  }

  Future signInWithGoogle() async {
    try {
      final response = await _supabase.client.auth.signInWithOAuth(
        Provider.google,
        redirectTo: kIsWeb
            ? 'http://localhost:5975'
            : 'tech.csitelites.transport.lines://login-callback',
      );
      print(response);
      final Session? session = _supabase.client.auth.currentSession;
      final User? user = _supabase.client.auth.currentUser;
      if (user != null) {
        return user.userMetadata;
      } else {
        return null;
      }
    } on AuthException catch (error) {
      return error;
    } catch (_) {
      return Exception('Error');
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
