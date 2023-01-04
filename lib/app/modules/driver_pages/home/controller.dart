import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../data/services/line_service.dart';
import '../../../data/services/user_service.dart';

class DriverHomeController extends GetxController {
  final UserService userService = UserService();
  final LineService lineService = LineService();

  RxList porfiles = [].obs;
  RxList lines = [].obs;
  RxBool isExpanded = true.obs;

  @override
  void onInit() async {
    lines.value = await lineService.getLines();
    porfiles.value = await userService.getPorfile();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
