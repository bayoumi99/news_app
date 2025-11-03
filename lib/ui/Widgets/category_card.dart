import 'package:flutter/material.dart';
import 'package:news_app/core/Theme/app_Color.dart';
import 'package:news_app/core/utls/context_extations.dart';
import 'package:news_app/core/utls/padding.dart';
import 'package:news_app/model/category_Dm.dart';

class CategoryCard extends StatelessWidget {
  final CategoryDm category;
  final Function(CategoryDm) onpress;

  const CategoryCard({super.key, required this.category, required this.onpress});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: Image.asset(
              context.appConfigProvider.isDarkMode
                  ? category.imageLightPath
                  : category.imageDarkPath,
              fit: BoxFit.cover,
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
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: context.colors.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColor.grey,
                      borderRadius: BorderRadius.circular(1000),
                    ),
                    child: Directionality(
                      textDirection:
                      category.isRtl ? TextDirection.rtl : TextDirection.ltr,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("View All").withHorizontalPadding(16),
                          Container(
                            padding:  EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: context.colors.surface,
                              shape: BoxShape.circle,
                            ),
                            child:  Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 16,
                            ),
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
