import 'package:get/get.dart';
import 'controller.dart';

class RoleBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RoleController>(() => RoleController());
  }
}
