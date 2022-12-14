import 'package:get/get.dart';
import 'controller.dart';

class StudentHomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentHomeController>(() => StudentHomeController());
  }
}
