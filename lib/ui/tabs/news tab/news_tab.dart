import 'package:flutter/material.dart';
import 'package:news_app/core/base/Base_view.dart';
import 'package:news_app/core/utls/context_extations.dart';
import 'package:news_app/core/utls/padding.dart';
import 'package:news_app/core/utls/white_spacing.dart';
import 'package:news_app/model/articles_response.dart';
import 'package:news_app/model/category_Dm.dart';
import 'package:news_app/ui/Widgets/articles_ui.dart';
import 'package:news_app/ui/tabs/news tab/news_tab_viewModel.dart';
import 'package:provider/provider.dart';

class NewsTab extends StatefulWidget {
  final CategoryDm categoryDm;

  const NewsTab({super.key, required this.categoryDm});

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends BaseView<NewsTab, NewsTabViewmodel> {
  NewsTabViewmodel newsTabViewmodel = NewsTabViewmodel();

  @override
  void initState() {
    super.initState();
    newsTabViewmodel.loadSources(widget.categoryDm.id);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: newsTabViewmodel,
      child: Column(
        children: [
          Consumer<NewsTabViewmodel>(
            builder: (_, __, ___) {
              if (newsTabViewmodel.SourceLoading) {
                return const LinearProgressIndicator();
              } else if (newsTabViewmodel.SourceErrorMasege != null) {
                return Center(
                  child: Text(
                    newsTabViewmodel.SourceErrorMasege.toString(),
                    style: context.textTheme.labelMedium,
                  ),
                );
              } else {
                return DefaultTabController(
                  length: newsTabViewmodel.Sources.length,
                  child: Column(
                    children: [
                      TabBar(
                        onTap: (index) {
                          newsTabViewmodel.loadArticles(
                            (newsTabViewmodel.Sources[index].id ?? '') as Source,
                          );
                        },
                        indicatorColor: Colors.transparent,
                        dividerHeight: 0,
                        tabAlignment: TabAlignment.center,
                        padding: EdgeInsets.zero,
                        indicatorPadding: EdgeInsets.zero,
                        isScrollable: true,
                        tabs: newsTabViewmodel.Sources
                            .map(
                              (source) => Text(source.name ?? "")
                              .withVerticalPadding(8),
                        )
                            .toList(),
                      ),
                    ],
                  ),
                );
              }
            },
          ),

          Expanded(
            child: Consumer<NewsTabViewmodel>(
              builder: (_, __, ___) {
                if (newsTabViewmodel.Sources.isEmpty) {
                  return const SizedBox();
                }

                if (newsTabViewmodel.ArticlesLoading) {
                  return const LinearProgressIndicator();
                } else if (newsTabViewmodel.ArticlesErrorMasege != null) {
                  return Center(
                    child: Text(
                      newsTabViewmodel.ArticlesErrorMasege.toString(),
                      style: context.textTheme.labelMedium,
                    ),
                  );
                } else if (newsTabViewmodel.articles.isEmpty) {
                  return Center(
                    child: Text(
                      "No Articles",
                      style: context.textTheme.labelMedium,
                    ),
                  );
                } else {
                  return ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemBuilder: (context, index) => ArticlesUi(
                      articles: newsTabViewmodel.articles[index],
                      article: newsTabViewmodel.articles[index],
                    ),
                    separatorBuilder: (context, index) => 16.spaceVertical,
                    itemCount: newsTabViewmodel.articles.length,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  NewsTabViewmodel getViewModel() => newsTabViewmodel;

  @override
  void showErrorMessage() {}

  @override
  void showSuccessMessage() {}
}
