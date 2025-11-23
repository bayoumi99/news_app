import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/utls/context_extations.dart';
import 'package:news_app/core/utls/white_spacing.dart';

import '../../model/articles_response.dart';


class ArticlesUi extends StatelessWidget {
  final Articles article;

  const ArticlesUi({required this.article, super.key, required Articles articles});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: context.colors.primary),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: CachedNetworkImage(
              imageUrl: article.urlToImage ?? "",
              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
              imageBuilder: (context, imageProvider) => Image(
                image: imageProvider,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          16.spaceVertical,
          Text(article.title ??"" , style: context.textTheme.labelMedium,),
          16.spaceVertical,
          Row(
            children: [
              Expanded(child: Text(article.author?? "" , style: context.textTheme.bodySmall,)),

              Text(article.publishedAt ??"" , style: context.textTheme.bodySmall,),
            ],
          )
        ],
      ),
    );
  }
}