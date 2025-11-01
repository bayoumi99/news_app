import 'package:flutter/material.dart';

import 'app_Color.dart';

abstract class AppTheme{
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: AppColor.purple,
        onPrimary: AppColor.white,
        secondary: AppColor.black,
        onSecondary: AppColor.white,
        error: Colors.red,
        onError: AppColor.white,
        surface: AppColor.lightBlue,
        onSurface: AppColor.purple
    ),

        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColor.purple,
          selectedItemColor: AppColor.white,
          unselectedItemColor: AppColor.white,

        ),
        filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
        ),
            padding: EdgeInsets.all(16),
        textStyle: TextStyle(
          fontSize:16,
          fontWeight: FontWeight.bold,
        )
      )
  ),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)
            ),
            padding: EdgeInsets.all(16),
            textStyle: TextStyle(
              fontSize:16,
              fontWeight: FontWeight.bold,
            )
    ),
  ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      elevation: 0,
    ),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            padding: EdgeInsets.all(16),
            textStyle: TextStyle(
              fontSize:16,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
                fontStyle: FontStyle.italic,
            ),
    )
    ),
    textTheme: TextTheme(
      titleLarge:  TextStyle(color: AppColor.purple),
      titleMedium:  TextStyle(color: AppColor.purple),
      titleSmall:  TextStyle(color: AppColor.purple),
      bodyLarge:  TextStyle(color: AppColor.black),
      bodyMedium:  TextStyle(color: AppColor.black),
      bodySmall:  TextStyle(color: AppColor.black),
      labelLarge:  TextStyle(color: AppColor.black),
      labelMedium:  TextStyle(color: AppColor.black),
      labelSmall:  TextStyle(color: AppColor.black),
  ),

      // appBarTheme: AppBarThemeData(
      //   backgroundColor: AppColor.lightBlue,
      //   foregroundColor: AppColor.purple,
      //   elevation: 0,
      //   surfaceTintColor: Colors.transparent,
      // ),
      // inputDecorationTheme: InputDecorationThemeData(
      //     iconColor: AppColor.grey,
      //     prefixIconColor: AppColor.grey,
      //     suffixIconColor: AppColor.grey,
      //   hintStyle: TextStyle(
      //     fontSize:14,
      //     color: AppColor.grey,
      //   ),
      //   enabledBorder: OutlineInputBorder(
      //     borderRadius: BorderRadius.circular(16),
      //     borderSide: BorderSide(color: AppColor.grey)
      //   ),
      //   disabledBorder: OutlineInputBorder(
      //       borderRadius: BorderRadius.circular(16),
      //       borderSide: BorderSide(color: AppColor.grey)
      //   ),
      //   focusedBorder: OutlineInputBorder(
      //       borderRadius: BorderRadius.circular(16),
      //       borderSide: BorderSide(color: AppColor.grey)
      //   ),
      //   errorBorder: OutlineInputBorder(
      //       borderRadius: BorderRadius.circular(16),
      //       borderSide: BorderSide(color: Colors.red)
      //   ),
      //   focusedErrorBorder: OutlineInputBorder(
      //       borderRadius: BorderRadius.circular(16),
      //       borderSide: BorderSide(color:Colors.red)
      //   )
      // )
  );
  static ThemeData darkTheme = ThemeData(
      colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: AppColor.purple,
          onPrimary: AppColor.white,
          secondary: AppColor.white,
          onSecondary: AppColor.darkPurple,
          error: Colors.red,
          onError: AppColor.white,
          surface: AppColor.darkPurple,
          onSurface: AppColor.white
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColor.darkPurple,
        selectedItemColor: AppColor.white,
        unselectedItemColor: AppColor.white,

      ),
      filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
              ),
              padding: EdgeInsets.all(16),
              textStyle: TextStyle(
                fontSize:16,
                fontWeight: FontWeight.bold,
              )
          )
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)
            ),
            padding: EdgeInsets.all(16),
            textStyle: TextStyle(
              fontSize:16,
              fontWeight: FontWeight.bold,
            )
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: 0,
      ),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            padding: EdgeInsets.all(16),
            textStyle: TextStyle(
              fontSize:16,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              fontStyle: FontStyle.italic,
            ),
          )
      ),
      textTheme: TextTheme(
        titleLarge:  TextStyle(color: AppColor.purple),
        titleMedium:  TextStyle(color: AppColor.purple),
        titleSmall:  TextStyle(color: AppColor.purple),
        bodyLarge:  TextStyle(color: AppColor.white),
        bodyMedium:  TextStyle(color: AppColor.white),
        bodySmall:  TextStyle(color: AppColor.white),
        labelLarge:  TextStyle(color: AppColor.white),
        labelMedium:  TextStyle(color: AppColor.white),
        labelSmall:  TextStyle(color: AppColor.white),
      ),

      // appBarTheme: AppBarThemeData(
      //   backgroundColor: AppColor.darkPurple,
      //   foregroundColor: AppColor.purple,
      //   elevation: 0,
      //   surfaceTintColor: Colors.transparent,
      // ),
      // inputDecorationTheme: InputDecorationThemeData(
      //     iconColor: AppColor.white,
      //     prefixIconColor: AppColor.white,
      //     suffixIconColor: AppColor.white,
      //     hintStyle: TextStyle(
      //       fontSize:14,
      //       color: AppColor.white,
      //     ),
      //     enabledBorder: OutlineInputBorder(
      //         borderRadius: BorderRadius.circular(16),
      //         borderSide: BorderSide(color: AppColor.purple)
      //     ),
      //     disabledBorder: OutlineInputBorder(
      //         borderRadius: BorderRadius.circular(16),
      //         borderSide: BorderSide(color: AppColor.purple)
      //     ),
      //     focusedBorder: OutlineInputBorder(
      //         borderRadius: BorderRadius.circular(16),
      //         borderSide: BorderSide(color: AppColor.purple)
      //     ),
      //     errorBorder: OutlineInputBorder(
      //         borderRadius: BorderRadius.circular(16),
      //         borderSide: BorderSide(color: Colors.red)
      //     ),
      //     focusedErrorBorder: OutlineInputBorder(
      //         borderRadius: BorderRadius.circular(16),
      //         borderSide: BorderSide(color:Colors.red)
      //     )
      // )
  );
}