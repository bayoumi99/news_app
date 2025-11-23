import 'package:flutter/material.dart';
import 'package:news_app/core/utls/context_extations.dart';
import 'package:news_app/core/utls/white_spacing.dart';
import 'package:news_app/model/category_Dm.dart';
import '../../Widgets/category_card.dart';

class HomeTab extends StatelessWidget {
  final Function(CategoryDm) onCardPress;
  const HomeTab({required this.onCardPress,super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Text(
            context.locale.homeGreeting,
            style: context.textTheme.titleLarge,
          ),
          8.spaceVertical,
          ...categories.map((category) => Column(
            children: [
              CategoryCard(category: category ,
                onpress: onCardPress,
                onPress: (CategoryDm p1) {  },),
              8.spaceVertical,
            ],
          )),
        ],
      ),
    );
  }
}
