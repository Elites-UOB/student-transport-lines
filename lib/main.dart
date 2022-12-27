import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:student_transport_lines/core/values/config.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'app/modules/auth/page.dart';
import 'app/modules/splash/binding.dart';
import 'app/modules/splash/page.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/color_theme.dart';
import 'routes/pages.dart';
import 'routes/routes.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Supabase.initialize(
    url: Config.SUPABASE_URL,
    anonKey: Config.SUPABASE_KEY,
  );

  runApp(ScreenUtilInit(
    designSize: const Size(360, 690),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) => GetMaterialApp(
      getPages: AppPages.pages,
      home: SplashPage(),
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      themeMode: Themes().getThemeMode(),
      initialBinding: SplashBinding(),
      initialRoute: Routes.Splash,
      debugShowCheckedModeBanner: false,
    ),
  ));
}
