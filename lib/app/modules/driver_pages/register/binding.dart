import 'package:get/get.dart';
import '../../auth/controller.dart';
import 'controller.dart';

class DriverRigisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
