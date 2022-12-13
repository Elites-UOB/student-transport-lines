import 'package:get/get.dart';
import 'controller.dart';

class StudentProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentProfileController>(() => StudentProfileController());
  }
}
