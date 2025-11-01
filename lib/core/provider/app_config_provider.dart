import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
ThemeMode appTheme = ThemeMode.light;
String locale = 'en';

void changeLocal(String newLocal){
  if(locale == newLocal)return;
  locale= newLocal;
  notifyListeners();
}

void changeTheme(ThemeMode nemTheme){
if(nemTheme == appTheme) return;
appTheme = nemTheme;
notifyListeners();
}

bool isDark(){
  return appTheme == ThemeMode.dark;
}
bool isEn(){
  return locale == "En";
}
}
