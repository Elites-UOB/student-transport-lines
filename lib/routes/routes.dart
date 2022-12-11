import 'package:get/get.dart';
import 'package:student_transport_lines/app/modules/student_pages/register/page.dart';
import '../app/modules/auth/binding.dart';
import '../app/modules/auth/page.dart';
import '../app/modules/driver_pages/home/binding.dart';
import '../app/modules/driver_pages/home/page.dart';
import '../app/modules/driver_pages/lineInformation/binding.dart';
import '../app/modules/driver_pages/lineInformation/page.dart';
import '../app/modules/driver_pages/register/binding.dart';
import '../app/modules/driver_pages/register/page.dart';
import '../app/modules/role/binding.dart';
import '../app/modules/role/page.dart';
import '../app/modules/student_pages/home/binding.dart';
import '../app/modules/student_pages/home/page.dart';
import '../app/modules/splash/binding.dart';
import '../app/modules/splash/page.dart';
import '../app/modules/student_pages/register/binding.dart';
import 'pages.dart';

abstract class AppPages {
  static final pages = [
    //General Routes
    GetPage(name: Routes.Auth, page: () => AuthPage(), binding: AuthBinding()),
    GetPage(
        name: Routes.SPLASH,
        page: () => SplashPage(),
        binding: SplashBinding()),
    GetPage(name: Routes.Role, page: () => RolePage(), binding: RoleBinding()),

    //Driver Routes
    GetPage(
        name: Routes.Driver_Register,
        page: () => DriverRegisterPage(),
        binding: DriverRigisterBinding()),

    GetPage(
        name: Routes.Driver_Home,
        page: () => DriverHomePage(),
        binding: DriverHomeBinding()),

    GetPage(
        name: Routes.Line_Information,
        page: () =>  LineInformationPage(),
        binding: LineInformationBinding()),

    //Student Routes
    GetPage(
        name: Routes.Student_Register,
        page: ()=>StudentRegisterPage(),
        binding: StudentRegisterBinding()),

    GetPage(
        name: Routes.Student_Home,
        page: ()=>StudentHomePage(),
        binding: StudentHomeBinding()
    )
  ];
}
