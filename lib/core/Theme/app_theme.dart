import 'package:flutter/material.dart';
import 'app_Color.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: AppColor.black,
        onPrimary: AppColor.white,
        secondary: AppColor.grey,
        onSecondary: AppColor.black,
        error: Colors.red,
        onError: AppColor.white,
        surface: AppColor.white,
        onSurface: AppColor.black
    ),
    textTheme: TextTheme(
      titleLarge:  TextStyle(color: AppColor.black),
      titleMedium:  TextStyle(color: AppColor.black),
      titleSmall:  TextStyle(color: AppColor.black),
      bodyLarge:  TextStyle(color: AppColor.grey),
      bodyMedium:  TextStyle(color: AppColor.grey),
      bodySmall:  TextStyle(color: AppColor.grey),
      labelLarge:  TextStyle(color: AppColor.black),
      labelMedium:  TextStyle(color: AppColor.black),
      labelSmall:  TextStyle(color: AppColor.black),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: AppColor.white,
        onPrimary: AppColor.black,
        secondary: AppColor.grey,
        onSecondary: AppColor.white,
        error: Colors.red,
        onError: AppColor.white,
        surface: AppColor.black,
        onSurface: AppColor.white
    ),
    textTheme: TextTheme(
      titleLarge:  TextStyle(color: AppColor.white),
      titleMedium:  TextStyle(color: AppColor.white),
      titleSmall:  TextStyle(color: AppColor.white),
      bodyLarge:  TextStyle(color: AppColor.grey),
      bodyMedium:  TextStyle(color: AppColor.grey),
      bodySmall:  TextStyle(color: AppColor.grey),
      labelLarge:  TextStyle(color: AppColor.white),
      labelMedium:  TextStyle(color: AppColor.white),
      labelSmall:  TextStyle(color: AppColor.white),
    ),
  );
}
