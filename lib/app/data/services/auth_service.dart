import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/Auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class AuthService extends GetxService {
  Future<AuthService> init() async => this;
  final RxBool isAuthenticated = false.obs;
  final RxBool isLogin = false.obs;

  static final _supabase = Supabase.instance;
  static final error = false;

  //check if user is authenticated

  void setIsAuthenticated(bool value) {
    isAuthenticated.value = value;
  }

  Future getPorfile() async {
    final userId = _supabase.client.auth.currentUser!.id;
    final data = await _supabase.client
        .from('porfiles')
        .select('*')
        .eq('id', userId)
        .single();
    return data;
  }

  checkAuthentication() async {
    final user = _supabase.client.auth.currentUser;
    final session = _supabase.client.auth.currentSession;
    if (user != null && session != null) {
      final data = await getPorfile();
      final role = data['role'];
      if (role == null || role.isEmpty) {
        Get.offNamed('/role');
      } else if (role == '1') {
        Get.offNamed('/driver/home');
      } else if (role == '0') {
        Get.offNamed('/student/home');
      }
      setIsAuthenticated(true);
    } else {
      setIsAuthenticated(false);
      Get.offNamed('/auth');
    }
  }

  Future signInWithGoogle() async {
    var response = await _supabase.client.auth.signInWithOAuth(
      Provider.google,
      redirectTo: kIsWeb
          ? 'http://localhost:24954'
          : 'tech.csitelites.transport.lines://login-callback',
    );

    if (response) {
      Supabase.instance.client.auth.onAuthStateChange.listen((data) async {
        final AuthChangeEvent event = data.event;
        if (event == AuthChangeEvent.signedIn) {
          final data = await getPorfile();
          final role = data['role'];
          if (role == null || role.isEmpty) {
            Get.offNamed('/role');
          } else if (role == '1') {
            Get.offNamed('/driver/home');
          } else if (role == '0') {
            Get.offNamed('/student/home');
          }
        }
      });
      return response;
    } else {
      return false;
    }
  }

  //Update Porfile

  Future updatePorfile(name, mobile, role, city, province, telegram) async {
    final userId = _supabase.client.auth.currentUser!.id;
    final data = await _supabase.client.from('porfiles').update({
      'full_name': name,
      'phone': mobile,
      'role': role,
      'city': city,
      'province': province,
      'telegarm': telegram,
    }).eq('id', userId);
    return data;
  }

  //signOut
  Future signOut() async {
    await _supabase.client.auth.signOut();
    Supabase.instance.client.auth.onAuthStateChange.listen((data) async {
      final AuthChangeEvent event = data.event;
      if (event == AuthChangeEvent.signedOut) {
        Get.offNamed('/auth');
      }
    });
  }
}
