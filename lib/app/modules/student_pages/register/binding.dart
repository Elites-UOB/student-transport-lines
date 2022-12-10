import 'package:get/get.dart';
import 'controller.dart';

class StudentRegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentRegisterController>(() => StudentRegisterController());
  }
}