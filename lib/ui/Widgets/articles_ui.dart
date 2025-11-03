import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/utls/context_extations.dart';
import 'package:news_app/core/utls/white_spacing.dart';
import 'package:news_app/model/articles_response.dart';

class ArticlesUi extends StatelessWidget {
  const ArticlesUi({super.key, required this.articles});
final Articles articles;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: context.colors.primary
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Center(
              child: CachedNetworkImage(imageUrl: articles.urlToImage??"",
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
              imageBuilder: (context, imageProvider) =>  Image(
                image: imageProvider,
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
                    ),

              ),
            ),
          ),
          16.spaceVertical,
          Text(articles.title??"",
          style: context.textTheme.titleMedium
          ),
          16.spaceVertical,
          Row(
            children: [
              Expanded(
                child: Text(articles.author??"",
                style: context.textTheme.bodySmall
                ),
              ),
              Text(articles.publishedAt??"",
              style: context.textTheme.bodyMedium
              ),
            ],
          ),
        ],
      ),
    );
  }
}
