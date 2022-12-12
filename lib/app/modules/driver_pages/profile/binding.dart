import 'package:get/get.dart';
import 'controller.dart';

class DriverProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DriverProfileController>(() => DriverProfileController());
  }
}