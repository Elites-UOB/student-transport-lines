import 'package:get/get.dart';
import 'package:student_transport_lines/app/modules/student_pages/register/page.dart';
import '../app/middleware/auth_middleware.dart';
import '../app/modules/auth/binding.dart';
import '../app/modules/auth/page.dart';
import '../app/modules/driver_pages/home/binding.dart';
import '../app/modules/driver_pages/home/page.dart';
import '../app/modules/driver_pages/new_line/binding.dart';
import '../app/modules/driver_pages/new_line/page.dart';
import '../app/modules/driver_pages/profile/binding.dart';
import '../app/modules/driver_pages/profile/page.dart';
import '../app/modules/driver_pages/register/page.dart';
import '../app/modules/role/binding.dart';
import '../app/modules/role/page.dart';
import '../app/modules/splash/binding.dart';
import '../app/modules/splash/page.dart';
import '../app/modules/student_pages/home/binding.dart';
import '../app/modules/student_pages/home/page.dart';

import '../app/modules/student_pages/profile/binding.dart';
import '../app/modules/student_pages/profile/page.dart';
import 'pages.dart';

abstract class AppPages {
  static final pages = [
    //General Routes
    GetPage(name: Routes.Auth, page: () => AuthPage(), binding: AuthBinding()),
    GetPage(
        name: Routes.Splash,
        page: () => SplashPage(),
        binding: SplashBinding()),

    GetPage(
        name: Routes.Role,
        page: () => RolePage(),
        // middlewares: [AuthMiddleware()],
        binding: RoleBinding()),

    //Driver Routes
    GetPage(
        name: Routes.Driver_Register,
        page: () => DriverRegisterPage(),
        // middlewares: [AuthMiddleware()],
        binding: AuthBinding()),

    GetPage(
        name: Routes.Driver_Home,
        page: () => DriverHomePage(),
        // middlewares: [AuthMiddleware()],
        binding: DriverHomeBinding()),

    GetPage(
        name: Routes.New_Line,
        page: () => NewLinePage(),
        binding: NewLineBinding()),

    GetPage(
        name: Routes.Driver_Profile,
        page: () => DriverProfilePage(),
        // middlewares: [AuthMiddleware()],
        binding: DriverProfileBinding()),

    //Student Routes
    GetPage(
        name: Routes.Student_Home,
        page: () => StudentHomePage(),
        // middlewares: [AuthMiddleware()],
        binding: StudentHomeBinding()),
    GetPage(
        name: Routes.Student_Register,
        page: () => StudentRegisterPage(),
        binding: AuthBinding()),

    GetPage(
        name: Routes.Student_Profile,
        page: () => StudentProfilePage(),
        // middlewares: [AuthMiddleware()],
        binding: StudentProfileBinding()),
  ];
}
