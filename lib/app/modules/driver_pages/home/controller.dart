import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../data/services/user_service.dart';

class DriverHomeController extends GetxController {
  final UserService userService = UserService();
  RxList porfiles = [].obs;

  @override
  void onInit() async {
    porfiles.value = await userService.getPorfile();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
