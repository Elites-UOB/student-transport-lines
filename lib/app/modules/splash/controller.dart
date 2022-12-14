import 'package:get/get.dart';

import '../../data/services/auth_service.dart';

class SplashController extends GetxController {
  final AuthService authService = AuthService();
  RxBool isAuth = true.obs;
  @override
  void onInit() async {
    Future.delayed(Duration(seconds: 6), () async {
      await authService.checkAuthentication();
    });

    super.onInit();
  }
}
