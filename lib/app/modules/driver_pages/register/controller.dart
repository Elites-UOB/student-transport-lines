import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../data/services/auth_service.dart';

class DriverRegisterController extends GetxController {
  final AuthService authService = AuthService();

  //Form Controllers
  final name = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final telegarm = TextEditingController();
  final password = TextEditingController();
  final cityId = TextEditingController();
  final provinceId = TextEditingController();
  final authKey = GlobalKey<FormState>();
  //bools
  RxBool showPassword = false.obs;
  RxBool isLoading = false.obs;

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

  register() async {
    try {
      isLoading == true;
      if (authKey.currentState!.validate()) {
        authKey.currentState!.save();
        var user = await authService.signUp(email.text, password.text,
            name.text, phone.text, 'driver', '1', '1', telegarm.text);
        if (user != null) {
          Get.offAllNamed('/driver/home');
        } else {
          Get.snackbar('خطأ', 'حدث خطأ ما');
        }
      }
    } finally {
      isLoading(false);
    }
  }
}
