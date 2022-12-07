import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/services/helper_service.dart';

class HelperController extends GetxController {
  static HelperController get to => Get.find();
  RxList<dynamic> cities = <dynamic>[].obs;
  RxString selectedCity = ''.obs;

  @override
  void onInit() async {
    await getCities();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getCities() async {
    final data = await HelperService().fatch();
    cities.value = data;
    return data;
  }

  void showSnackBar(String message) {
    Get.snackbar(
      'Error',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }
}
