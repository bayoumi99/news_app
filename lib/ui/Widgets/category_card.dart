import 'package:flutter/material.dart';
import 'package:news_app/core/utls/context_extations.dart';
import 'package:news_app/core/utls/padding.dart';
import '../../model/category_Dm.dart';


class CategoryCard extends StatelessWidget {
  final CategoryDm category;
  final Function(CategoryDm) onPress;

  const CategoryCard({
    required this.category,
    required this.onPress,
    super.key,
    required Function(CategoryDm p1) onpress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPress(category);
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: Image.asset(
              context.appConfigProvider.isDarkMode
                  ? category.imageLightPath
                  : category.imageDarkPath,
            ),
          ),
          Positioned.fill(
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Column(
                crossAxisAlignment: category.isRtl
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.appConfigProvider.isEn
                        ? category.nameEn
                        : category.nameAr,
                    style: context.textTheme.headlineMedium!.copyWith(
                      color: context.colors.surface,
                      fontWeight: FontWeight.bold,
                    ),
                  ).withVerticalPadding(16),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(1000),
                    ),
                    child: Directionality(
                      textDirection: category.isRtl
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("viewAll").withHorizontalPadding(16),
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: context.colors.surface,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.arrow_forward_ios),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ).withPadding(16),
            ),
          ),
        ],
      ),
    );
  }
}