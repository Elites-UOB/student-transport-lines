import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Themes {
  static ThemeData darkTheme = ThemeData(
    fontFamily: "Tajawal",
  );
  static ThemeData lightTheme = ThemeData(
    fontFamily: "Tajawal",
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
