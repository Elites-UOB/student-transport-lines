import 'dart:collection';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:student_transport_lines/app/modules/role/widgets/step1.dart';
import 'package:student_transport_lines/app/modules/role/widgets/step2.dart';

class RoleController extends GetxController {
  RxList steps = [
    const Step1(),
    const Step2(),
    const Step1(),
    const Step2(),
    const Step1(),
  ].obs;

  RxInt currentStep = 0.obs;

  RxList plainCities = [].obs;
  List provinces = [
    "اربيل",
    "الانبار",
    "البصرة",
    "السليمانية",
    "القادسية",
    "المثنى",
    "النجف",
    "بابل",
    "بغداد",
    "دهوك",
    "ديالى",
    "ذي قار",
    "صلاح الدين",
    "كربلاء",
    "كركوك",
    "ميسان",
    "نينوى",
    "واسط"
  ];
  RxList cities = [].obs;

  RxInt role = 0.obs; // 0 => user, 1 => driver
  RxString name = "".obs;
  RxString mobile = "".obs;
  RxString telegram = "".obs;
  RxString province = "البصرة".obs;
  RxString city = "مركز شط العرب".obs;

  void nextStep() {
    if (currentStep.value < steps.length - 1) {
      currentStep.value++;
    }
  }

  void previousStep() {
    if (currentStep.value > 0) {
      currentStep.value--;
    }
  }

  void goToStep(int step) {
    if (step >= 0 && step < steps.length) {
      currentStep.value = step;
    }
  }

  @override
  void onInit() async {
    super.onInit();
    await readJson();
  }

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/cities.json');
    final data = await json.decode(response);
    plainCities.value = data;
    getCities(province.value);
  }

  void getCities(String province) {
    cities.value = plainCities
        .where((p0) => p0['province_ar'] == province)
        .map((e) => e["city_ar"])
        .toList();
    city.value = cities.first;
  }
}
