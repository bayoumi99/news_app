import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:news_app/core/utls/context_extations.dart';
import 'package:news_app/core/utls/padding.dart';
import 'package:news_app/core/utls/white_spacing.dart';

class NewsDrawerWidget extends StatelessWidget {
  const NewsDrawerWidget({super.key, required this.goToHome});
  final Function goToHome;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              padding: EdgeInsets.symmetric(vertical:40 ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              )
              ,child: Text(context.locale.newsApp,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),)),
          InkWell(
            onTap: (){
goToHome();
},
            child: Row(
              children: [
                Icon(EvaIcons.home_outline, color: context.colors.primary,),
                16.spaceHorizontal,
                Text(context.locale.goToHome ,style: context.textTheme.titleLarge,)
              ],
            ).withPadding(16),
          ),
          Divider().withPadding(16),
          Row(
            children: [
              Icon(EvaIcons.color_palette_outline, color: context.colors.primary,),
              16.spaceHorizontal,
              Text(context.locale.theme ,style: context.textTheme.titleLarge,)
            ],
          ).withPadding(16),
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  width: 1,
                  color: context.colors.primary,
                )
            ),
            child: DropdownButton<ThemeMode>(
                isExpanded: true,
                items: [ThemeMode.light , ThemeMode.dark]
                    .map(
                        (theme)=> DropdownMenuItem<ThemeMode>(
                      value: context.appConfigProvider.themeMode,
                      child: Text(theme == ThemeMode.dark? context.locale.light :context.locale.dark),
                    )
                ).toList(),
                underline: SizedBox(),
                onChanged: ( theme){
                  context.appConfigProvider.toggleTheme(theme?? context.appConfigProvider.themeMode);
                }),
          ),
          Divider().withPadding(16),
          Row(
            children: [
              Icon(IonIcons.earth, color: context.colors.primary,),
              16.spaceHorizontal,
              Text(context.locale.locale ,style: context.textTheme.titleLarge,)
            ],
          ).withPadding(16),
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  width: 1,
                  color: context.colors.primary,
                )
            ),
            child: DropdownButton<String>(
                isExpanded: true,
                items: ["Ar" , "En"]
                    .map(
                        (local)=> DropdownMenuItem<String>(
                      value: context.appConfigProvider.locale,
                      child: Text(local == "En"?context.locale.arabic:context.locale.english),
                    )
                ).toList(),
                underline: SizedBox(),
                onChanged: ( local){
                  context.appConfigProvider.changeLocal(local?? context.appConfigProvider.locale);
                }),
          ),

        ],
      ),

    );
  }
}
