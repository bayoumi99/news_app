import 'package:flutter/material.dart';
import 'package:news_app/core/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';

extension themeExtention on BuildContext{

  ColorScheme  get  colors => Theme.of(this).colorScheme;

  TextTheme  get  textTheme => Theme.of(this).textTheme;

  ThemeData  get  theme => Theme.of(this);

 AppConfigProvider   get appConfigProvider => Provider.of<AppConfigProvider>(this, listen: false);

 AppLocalizations get locale => AppLocalizations.of(this)!;
}