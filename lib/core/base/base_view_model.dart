import 'package:flutter/material.dart';
import 'package:news_app/core/base/base_Navigator.dart';

class BaseViewModel<N extends BaseNavigator> extends ChangeNotifier{
 N? navigator;
}