import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/provider/app_config_provider.dart';
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
    var provider = Provider.of<AppConfigProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Image.asset("assets/image/${provider.isDarkMode ?"news_logo.png": "news_logo_light.png"}",
                    width:size.width *0.8),
              ).zoomIn().slideUp(),
            ),
            Positioned(
              bottom: 32,
              child: Image.asset("assets/image/${provider.isDarkMode ?"news_branding.png": "news_branding_light.png"}",
                  width:size.width *0.4).zoomIn().slideUp(),
            )
          ],
        ),
      ),
    );
  }
}