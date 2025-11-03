import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
ThemeMode themeMode = ThemeMode.dark;
String locale = 'en';

void changeLocal(String newLocal){
  if(locale == newLocal)return;
  locale= newLocal;
  notifyListeners();
}

void toggleTheme(ThemeMode mode){
if(mode == themeMode) return;
themeMode = mode;
notifyListeners();
}
bool  get isDarkMode =>themeMode == ThemeMode.dark;
bool  get isEn =>locale == 'en';













}
