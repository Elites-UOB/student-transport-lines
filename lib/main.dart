import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:student_transport_lines/app/modules/auth/page.dart';
import 'package:student_transport_lines/app/modules/role/binding.dart';
import 'package:student_transport_lines/core/values/config.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'app/modules/student_pages/home/binding.dart';
import 'app/modules/student_pages/home/page.dart';
import 'routes/pages.dart';
import 'routes/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
      initialBinding: RoleBinding(),
      initialRoute: Routes.Role,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'AE'), // English, no country code
      ],
    ),
  ));
}
