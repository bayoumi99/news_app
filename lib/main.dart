import 'package:flutter/material.dart';

void main() {
  runApp(const newsApp());
}

class newsApp extends StatelessWidget {
  const newsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // routes: {
      //   StartScreen.routeName :(context)=> StartScreen(),
      //   InfoScreen.routeName :(context)=> InfoScreen(),
      //   HomeScreen.routeName :(context)=> HomeScreen(),
      //   SuraDetailsScreen.routeName :(context)=> SuraDetailsScreen(),
      //   HadethDetailsScreen.routeName :(context)=> HadethDetailsScreen(),
      //
      //
      // },

      // initialRoute: StartScreen.routeName,
    );
  }
}