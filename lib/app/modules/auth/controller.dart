import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../data/services/auth_service.dart';
import '../../data/services/helper_service.dart';

class AuthController extends GetxController {
  final AuthService authService = AuthService();

  final currentRoute = Get.currentRoute.obs;

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
  RxList colleges = [].obs;
  RxList universities = [].obs;

  @override
  void onInit() async {
    await fatch();
    print('currentRoute: $currentRoute');
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
    final universitiesData = await HelperService().getUniversities();
    final collegesData = await HelperService().getColleges();
    cities.value = citiesData;
    provinces.value = provincesData;
    universities.value = universitiesData;
    colleges.value = collegesData;
  }

  //signIn
  login() async {
    try {
      isLoading.value = true;
      var user = await authService.signIn(email.text, password.text);
      if (user != null) {
        currentRoute == '/driver/register'
            ? Get.offAllNamed('/driver/home')
            : Get.offAllNamed('/student/home');
      }
    } finally {
      isLoading.value = false;
    }
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
            currentRoute == '/driver/register'
                ? Get.offAllNamed('/driver/home')
                : Get.offAllNamed('/student/home');
          } else {
            Get.snackbar('خطأ', 'حدث خطأ ما');
          }
        }
      }
    } finally {
      isLoading.value = false;
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
