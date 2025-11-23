import 'package:flutter/material.dart';
import 'package:news_app/core/base/Base_view.dart';
import 'package:news_app/core/utls/context_extations.dart';
import 'package:news_app/ui/Widgets/home_Navigator.dart';
import 'package:news_app/ui/screens/home%20screen/home_view_model.dart';
import 'package:news_app/ui/tabs/home%20tab/home_tab.dart';
import 'package:news_app/ui/tabs/news%20tab/news_tab.dart';
import 'package:provider/provider.dart';

import '../../Widgets/news_drawer_widget.dart';
import '../search screen/sreach_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen ({super.key});
    static const String routeName = "home Screen ";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseView<HomeScreen, HomeViewModel> implements HomeNavigator{


HomeViewModel homeViewModel=HomeViewModel();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: homeViewModel,
      child: Consumer<HomeViewModel>(
        builder: (context, _, _) => Scaffold(
          drawer: NewsDrawerWidget(goToHome: homeViewModel.gotoHome),
          appBar: AppBar(
            title: Text(homeViewModel.selectedCategory == null
                ?context.locale.home
                :context.appConfigProvider.isEn
                ?homeViewModel.selectedCategory !.nameEn
                :homeViewModel.selectedCategory !.nameAr
            ),
            centerTitle: true,
          actions: [
            IconButton(onPressed: (){
              Navigator.pushNamed(context, SreachScreen.routeName);
            }, icon:Icon( Icons.search))
          ],
          ),
          body:homeViewModel.selectedCategory ==null ?
          HomeTab(onCardPress: homeViewModel.onChoseCategoryCardPress,
          ):NewsTab(categoryDm: homeViewModel.selectedCategory !),
        
        ),
      ),
    );
  }

  @override
  void pop() {
    Navigator.pop(context);
  }

  @override
  void showErrorMessage() {
    // TODO: implement showErrorMessage
  }

  @override
  void showSuccessMessage() {
    // TODO: implement showSuccessMessage
  }

  @override
  HomeViewModel getViewModel()=> homeViewModel;


}
