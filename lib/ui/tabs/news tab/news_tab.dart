import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/core/utls/context_extations.dart';
import 'package:news_app/core/utls/padding.dart';
import 'package:news_app/core/utls/white_spacing.dart';
import 'package:news_app/model/articles_response.dart';
import 'package:news_app/model/category_Dm.dart';
import 'package:news_app/ui/Widgets/articles_ui.dart';

class NewsTab extends StatelessWidget {
  final CategoryDm categoryDm;
  final ApiManager apiManager = ApiManager();

   NewsTab({super.key, required this.categoryDm});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
            future: apiManager.getSources(categoryDm.id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return LinearProgressIndicator();
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString(),
                    style: context.textTheme.labelMedium,),
                );
              } else if (snapshot.hasData) {
                if(snapshot.data?.code != null){
                  return Center(
                    child: Text(snapshot.data!.message??"",
                      style: context.textTheme.labelMedium,),
                  );
                }
                var source = snapshot.data?.sources??[];
                var selectedSource= source.first;
                return Expanded(
                  child: Column(
                    children: [
                    DefaultTabController(
                    length: source.length,
                    child: TabBar(
                      onTap: (index){
                        selectedSource = source[index];
                      },
                        indicatorColor: Colors.transparent,
                        dividerHeight: 0,
                        tabAlignment: TabAlignment.center,
                        padding: EdgeInsets.all(0),
                        indicatorPadding: EdgeInsets.zero,
                        isScrollable: true,
                        tabs:
                        source.map((source)=>Text(
                            source.name??"").withVerticalPadding(8)
                        ).toList()


                    ),


                  ),
                      Expanded(child: FutureBuilder<ArticalResponse>(
                          future: apiManager.getArticalResponse(selectedSource.id??""),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                                 } else if (snapshot.hasData) {
                              return ListView.separated(
                                padding: EdgeInsets.all(16),
                          itemBuilder: (context, index) => ArticlesUi(articles: articles[index], ),
                                  separatorBuilder: (context, index) => 16.spaceVertical ,
                                  itemCount: articles.length
                              );
                            } else if (snapshot.hasError) {
                            return  Center(child: Text(snapshot.error.toString(),
                            style: context.textTheme.labelMedium,
                            )
                            );
                            } else {
                              return SizedBox();
                            }
                          }

                      )
                      )
                    ],
                  ),
                );
              } else {
                return SizedBox();
              }
            }
        )
      ]
    );
              }
            }