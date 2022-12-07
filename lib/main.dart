import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:student_transport_lines/app/modules/auth/page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'app/modules/home/binding.dart';
import 'app/modules/home/page.dart';
import 'routes/pages.dart';
import 'routes/routes.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://wqnvwebtpyiyhxjxiejf.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6IndxbnZ3ZWJ0cHlpeWh4anhpZWpmIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzAxOTIyNzEsImV4cCI6MTk4NTc2ODI3MX0.t2j836dYg6X0E2WtEBgRy9N27OkJUgdMZ-4TPnY22zA',
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
      initialBinding: HomeBinding(),
      initialRoute: Routes.HOME,
      debugShowCheckedModeBanner: false,
    ),
  ));
}
