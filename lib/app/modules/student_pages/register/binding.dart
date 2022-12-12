import 'package:get/get.dart';
import '../../auth/controller.dart';
import 'controller.dart';

class StudentRegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
