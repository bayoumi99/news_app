import 'package:flutter/material.dart';
import 'package:news_app/core/utls/context_extations.dart';
import 'package:news_app/model/category_Dm.dart';
import 'package:news_app/ui/tabs/home%20tab/home_tab.dart';
import 'package:news_app/ui/tabs/news%20tab/news_tab.dart';

import '../../Widgets/news_drawer_widget.dart';
import '../search screen/sreach_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen ({super.key});
    static const String routeName = "home Screen ";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  CategoryDm? selectedCategory ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NewsDrawerWidget(goToHome: (){
        setState(() {
          selectedCategory=null;
        });
      Navigator.pop(context);
        },

      ),
      appBar: AppBar(
        title: Text(selectedCategory== null
            ?context.locale.home
            :context.appConfigProvider.isEn
            ?selectedCategory!.nameEn
            :selectedCategory!.nameAr
        ),
        centerTitle: true,
      actions: [
        IconButton(onPressed: (){
          Navigator.pushNamed(context, SreachScreen.routeName);
        }, icon:Icon( Icons.search))
      ],
      ),
      body:selectedCategory==null ? HomeTab(onCardPress: (CategoryDm category) {
        setState(() {
          selectedCategory == category;
        });
      },):NewsTab(categoryDm: selectedCategory!),

    );
  }
}
