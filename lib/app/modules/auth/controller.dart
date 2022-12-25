import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../data/services/auth_service.dart';
import '../../data/services/helper_service.dart';

class AuthController extends GetxController {
  final AuthService authService = AuthService();

  final currentRoute = Get.currentRoute.obs;

  RxBool isLoading = false.obs;

  //List

  RxList cities = [].obs;
  RxList provinces = [].obs;
  RxList colleges = [].obs;
  RxList universities = [].obs;

  @override
  void onInit() async {
    await fatch();
    authService.isLogin();
    super.onInit();
  }

  void onClose() {
    super.onClose();
  }

  // validation() {
  //   if (name.text.isEmpty) {
  //     Get.snackbar('خطأ', 'الرجاء ادخال الاسم');
  //   } else if (email.text.isEmpty && !GetUtils.isEmail(email.text)) {
  //     //   Get.snackbar('خطأ', 'الرجاء ادخال البريد الالكتروني');
  //     // } else if (phone.text.isEmpty && phone.text.length < 11) {
  //     Get.snackbar('خطأ', 'الرجاء ادخال رقم الهاتف');
  //   } else if (telegarm.text.isEmpty) {
  //     Get.snackbar('خطأ', 'الرجاء ادخال رقم الهاتف');
  //   } else if (password.text.isEmpty && password.text.length < 6) {
  //     Get.snackbar('خطأ', 'الرجاء ادخال كلمة المرور');
  //     // } else if (cityId.text.isEmpty) {
  //     //   Get.snackbar('خطأ', 'الرجاء اختيار المدينة');
  //     // } else if (provinceId.text.isEmpty) {
  //     //   Get.snackbar('خطأ', 'الرجاء اختيار المحافظة');
  //   } else {
  //     return true;
  //   }
  // }

  fatch() async {
    final universitiesData = await HelperService().getUniversities();
    final collegesData = await HelperService().getColleges();
    universities.value = universitiesData;
    colleges.value = collegesData;
  }

  //signIn
  login() async {
    try {
      isLoading.value = true;
      var data = await authService.signInWithGoogle();
      if (data != null) {
        late String role = data['role'];
        if (role == 'driver') {
          Get.offAllNamed('/driver/home');
        } else if (role == 'student') {
          Get.offAllNamed('/student/home');
        } else {
          Get.snackbar('خطأ', 'حدث خطأ ما');
        }
      }
    } catch (e) {
      Get.snackbar('خطأ', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  //signOut
  logout() async {
    try {
      await authService.signOut();
      Get.offAllNamed('/auth');
    } finally {
      isLoading(false);
    }
  }
}
