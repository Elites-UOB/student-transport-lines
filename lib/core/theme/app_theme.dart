import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Themes {
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Color(0xff1e1e1e),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xff1e1e1e),
      elevation: 0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xff1e1e1e),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white54,
    ),
  );
  static ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Color(0xffF6F3F4),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xffF6F3F4),
      elevation: 0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xffF6F3F4),
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black54,
    ),
  );

  final _getStorage = GetStorage();

  final _darkThemeKey = 'isDarkTheme';

  void saveThemeData(bool isDarkMode) {
    _getStorage.write(_darkThemeKey, isDarkMode);
  }

  bool isSavedDarkMode() {
    return _getStorage.read(_darkThemeKey) ?? false;
  }

  ThemeMode getThemeMode() {
    return isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  void changeTheme() {
    Get.changeThemeMode(isSavedDarkMode() ? ThemeMode.light : ThemeMode.dark);

    saveThemeData(!isSavedDarkMode());
  }
}
