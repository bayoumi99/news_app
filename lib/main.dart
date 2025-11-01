import 'package:flutter/material.dart';
import 'package:news_app/ui/screens/home%20screen/home_screen.dart';
import 'package:news_app/ui/screens/search%20screen/sreach_screen.dart';
import 'package:news_app/ui/screens/start%20screen/start_screen.dart';

void main() {
  runApp(const newsApp());
}

class newsApp extends StatelessWidget {
  const newsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        StartScreen.routeName :(context)=> StartScreen(),
        HomeScreen.routeName :(context)=> HomeScreen(),
        SreachScreen.routeName :(context)=> SreachScreen(),
      },

      initialRoute: StartScreen.routeName,
    );
  }
}