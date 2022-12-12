import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../data/models/city.dart';
import '../../../data/services/auth_service.dart';
import '../../../data/services/helper_service.dart';

class DriverRegisterController extends GetxController {
  final AuthService authService = AuthService();

  final currentRoute = Get.currentRoute;

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

  //List

  RxList cities = [].obs;
  RxList provinces = [].obs;

  @override
  void onInit() async {
    await fatch();
    super.onInit();
  }

  void onClose() {
    name.dispose();
    email.dispose();
    password.dispose();
    super.onClose();
  }

  validation() {
    if (name.text.isEmpty) {
      Get.snackbar('خطأ', 'الرجاء ادخال الاسم');
    } else if (email.text.isEmpty && !GetUtils.isEmail(email.text)) {
      Get.snackbar('خطأ', 'الرجاء ادخال البريد الالكتروني');
    } else if (phone.text.isEmpty && phone.text.length < 11) {
      Get.snackbar('خطأ', 'الرجاء ادخال رقم الهاتف');
    } else if (telegarm.text.isEmpty) {
      Get.snackbar('خطأ', 'الرجاء ادخال رقم الهاتف');
    } else if (password.text.isEmpty && password.text.length < 6) {
      Get.snackbar('خطأ', 'الرجاء ادخال كلمة المرور');
      // } else if (cityId.text.isEmpty) {
      //   Get.snackbar('خطأ', 'الرجاء اختيار المدينة');
      // } else if (provinceId.text.isEmpty) {
      //   Get.snackbar('خطأ', 'الرجاء اختيار المحافظة');
    } else {
      return true;
    }
  }

  fatch() async {
    final citiesData = await HelperService().getCities();
    final provincesData = await HelperService().getProvinces();
    cities.value = citiesData;
    provinces.value = provincesData;
  }

  register() async {
    try {
      isLoading.value = true;
      if (validation() == true) {
        if (authKey.currentState!.validate()) {
          authKey.currentState!.save();
          var user = await authService.signUp(email.text, password.text,
              name.text, phone.text, 'driver', 1, 1, telegarm.text);
          if (user != null) {
            Get.offAllNamed('/driver/home');
          } else {
            Get.snackbar('خطأ', 'حدث خطأ ما');
          }
        }
      }
    } finally {
      isLoading.value = false;
    }
  }
}
