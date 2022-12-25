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

  checkAuthentication() async {
    final user = _supabase.client.auth.currentUser;
    final session = _supabase.client.auth.currentSession;

    if (user != null && session != null) {
      final data = await _supabase.client
          .from('porfiles')
          .select('role')
          .eq('id', user.id)
          .single();

      final role = data['role'];
      setIsAuthenticated(true);
      if (role == null || role.isEmpty) {
        Get.offNamed('/role');
      } else if (role == '1') {
        Get.offNamed('/driver/home');
      } else if (role == '1') {
        Get.offNamed('/student/home');
      }
    } else {
      setIsAuthenticated(false);
      Get.offNamed('/auth');
    }
  }

  Future signInWithGoogle() async {
    try {
      final response = await _supabase.client.auth.signInWithOAuth(
        Provider.google,
        redirectTo: kIsWeb
            ? 'http://localhost:24954'
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

    print('==================================');
    print(data);

    return data;
  }

  //signOut
  Future<dynamic> signOut() async {
    final response = await _supabase.client.auth.signOut();
    return response;
  }
}
