import 'package:flutter/material.dart';
import 'package:news_app/ui/Widgets/home_Navigator.dart';

import '../../../core/base/base_view_model.dart';
import '../../../model/category_Dm.dart';

class HomeViewModel extends BaseViewModel<HomeNavigator>{
  CategoryDm? selectedCategory ;
  onChoseCategoryCardPress(CategoryDm category){
    selectedCategory =category;
    notifyListeners();
  }

  gotoHome(BuildContext context){
    selectedCategory =null;
    Navigator.pop(context);
    notifyListeners();
  }

}