import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../../../core/Theme/app_Color.dart';
import '../home screen/home_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});
  static const String routeName = "Start Screen ";

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5),(){
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Image.asset("assets/image/news_logo.png",
                width:size.width *0.6),
          ).zoomIn().slideUp(),
          Positioned(
            bottom: 32,
            child: Image.asset("assets/image/news_branding.png",
                width:size.width *0.4).zoomIn().slideUp(),
          )
        ],
      ),
    );
  }
}