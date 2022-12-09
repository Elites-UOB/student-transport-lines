import 'package:get/get.dart';
import 'controller.dart';

class DriverRigisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentRegisterController>(() => StudentRegisterController());
  }
}