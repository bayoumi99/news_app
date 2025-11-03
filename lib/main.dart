import 'package:flutter/material.dart';
import 'package:news_app/core/provider/app_config_provider.dart';
import 'package:news_app/ui/screens/home%20screen/home_screen.dart';
import 'package:news_app/ui/screens/search%20screen/sreach_screen.dart';
import 'package:news_app/ui/screens/start%20screen/start_screen.dart';
import 'package:provider/provider.dart';
import 'core/Theme/app_theme.dart';
import 'l10n/app_localizations.dart';

void main() {
  runApp(const newsApp());
}

class newsApp extends StatefulWidget {
  const newsApp({super.key});

  @override
  State<newsApp> createState() => _newsAppState();
}

class _newsAppState extends State<newsApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppConfigProvider(),
      builder: (context, child) {
        var provider = Provider.of<AppConfigProvider>(context);
        return MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale(provider.locale),
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: provider.themeMode,
          routes: {
            StartScreen.routeName :(context)=> StartScreen(),
            HomeScreen.routeName :(context)=> HomeScreen(),
            SreachScreen.routeName :(context)=> SreachScreen(),

          },

          initialRoute: StartScreen.routeName,
        );
      }

    );
  }
}