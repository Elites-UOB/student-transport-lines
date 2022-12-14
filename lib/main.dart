import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:student_transport_lines/app/modules/auth/page.dart';
import 'package:student_transport_lines/core/values/config.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'app/modules/auth/binding.dart';
import 'routes/pages.dart';
import 'routes/routes.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      home: AuthPage(),
      theme: ThemeData(
        fontFamily: "Tajawal",
        //     colorScheme: ColorScheme.fromSwatch().copyWith(
        //       primary: Palette.primaryColor,
        //       secondary: Palette.secondaryColor,
      ),
      initialBinding: AuthBinding(),
      initialRoute: Routes.Auth,
      debugShowCheckedModeBanner: false,
    ),
  ));
}
