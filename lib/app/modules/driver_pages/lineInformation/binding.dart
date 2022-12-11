import 'package:get/get.dart';
import 'controller.dart';

class LineInformationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LineInformationController>(() => LineInformationController());
  }
}
