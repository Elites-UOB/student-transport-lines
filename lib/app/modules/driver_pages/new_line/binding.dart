import 'package:get/get.dart';
import 'controller.dart';

class NewLineBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewLineController>(() => NewLineController());
  }
}
