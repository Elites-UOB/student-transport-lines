import 'package:get/get.dart';
import 'controller.dart';

class DriverLogin implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DriverLoginController>(() => DriverLoginController());
  }
}
