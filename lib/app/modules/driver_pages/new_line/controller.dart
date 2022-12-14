import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/services/helper_service.dart';
import '../../../data/services/line_service.dart';

class NewLineController extends GetxController {
  final LineService _lineService = LineService();
  final HelperService _helperService = HelperService();

  //Form Controllers
  final carModel = TextEditingController();
  final price = TextEditingController();
  final carPassCount = TextEditingController();
  final passCount = TextEditingController();
  final cityId = TextEditingController();
  final provinceId = TextEditingController();
  final type = TextEditingController();
  final collegeId = TextEditingController();
  final universityId = TextEditingController();

  //bools
  RxBool isLoading = false.obs;

  //List
  RxList cities = [].obs;
  RxList provinces = [].obs;
  RxList colleges = [].obs;
  RxList universities = [].obs;

  @override
  void onInit() async {
    await fatch();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  //Add New Line
  addNewLine() async {
    try {
      isLoading.value = true;
      final data = await _lineService.insert(
        carModel.text,
        price.text,
        passCount.text,
        carPassCount.text,
        universityId.text,
        collegeId.text,
        provinceId.text,
        cityId.text,
        type.text,
      );
      if (data) {
        print('====================================');
        print(data);
        Get.snackbar('تم', 'تم اضافة الخط بنجاح');
      } else {
        Get.snackbar('خطأ', 'حدث خطأ ما');
      }
    } catch (e) {
      print('=================e===================');
      print(e);
      Get.snackbar('خطأ', 'حدث خطأ ما');
    } finally {
      isLoading.value = false;
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
}
