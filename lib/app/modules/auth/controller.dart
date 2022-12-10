import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../data/services/auth_service.dart';

class AuthController extends GetxController {
  final AuthService authService = AuthService();
  final authKey = GlobalKey<FormState>();

  //Form Controllers
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  //bools
  RxBool showPassword = false.obs;
  RxBool isLoading = false.obs;
  RxBool isRegister = false.obs;

  @override
  void onInit() async {
    super.onInit();
  }

  void onClose() {
    name.dispose();
    email.dispose();
    password.dispose();
    super.onClose();
  }

  String? valideateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return 'البريد الالكتروني غير صالح';
    } else {
      return null;
    }
  }

  String? valideatePassworde(String value) {
    if (value.length < 6) {
      return 'كلمة المرور غير صالحة';
    } else {
      return null;
    }
  }

  login() async {
    try {
      isLoading(true);
      if (authKey.currentState!.validate()) {
        authKey.currentState!.save();
        await authService.signIn(email.text, password.text);
      }
    } finally {
      isLoading(false);
    }
  }

  //signOut
  signOut() async {
    try {
      isLoading(true);
      await authService.signOut();
    } finally {
      isLoading(false);
    }
  }
}
