import 'package:get/get.dart';
import '../app/modules/auth/binding.dart';
import '../app/modules/auth/page.dart';
import '../app/modules/home/binding.dart';
import '../app/modules/home/page.dart';
import '../app/modules/splash/binding.dart';
import '../app/modules/splash/page.dart';
import 'pages.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.Auth, page: () => AuthPage(), binding: AuthBinding()),
    GetPage(
        name: Routes.SPLASH,
        page: () => SplashPage(),
        binding: SplashBinding()),
    GetPage(name: Routes.HOME, page: () => HomePage(), binding: HomeBinding()),
  ];
}
