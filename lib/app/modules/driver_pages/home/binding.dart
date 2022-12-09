import 'package:get/get.dart';
import 'controller.dart';

class DriverHomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DriverHomeController>(() => DriverHomeController());
  }
}