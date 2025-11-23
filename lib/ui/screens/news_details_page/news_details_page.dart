import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_app/model/articles_response.dart';

import '../news_webview_page/news_webview_page.dart';

class NewsDetailsPage extends StatelessWidget {
  final Articles article;

  const NewsDetailsPage({required this.article, super.key});

  @override
  Widget build(BuildContext context) {
    final String heroTag = article.url ?? article.title ?? UniqueKey().toString();

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(article.source?.name ?? 'News'),
        leading: BackButton(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: heroTag,
              child: article.urlToImage != null && article.urlToImage!.isNotEmpty
                  ? CachedNetworkImage(
                imageUrl: article.urlToImage!,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
                placeholder: (_, __) => Container(
                  width: double.infinity,
                  height: 250,
                  color: Colors.grey[900],
                  child: const Center(child: CircularProgressIndicator()),
                ),
                errorWidget: (_, __, ___) => Container(
                  width: double.infinity,
                  height: 250,
                  color: Colors.grey[900],
                  child: const Icon(Icons.broken_image, size: 56),
                ),
              )
                  : Container(
                width: double.infinity,
                height: 250,
                color: Colors.grey[900],
                child: const Icon(Icons.image_not_supported, size: 56),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                article.title ?? 'No title',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                (article.publishedAt != null ? '${_formatDate(article.publishedAt!)} • ' : '') +
                    (article.source?.name ?? ''),
                style: TextStyle(color: Colors.grey[400], fontSize: 13),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                article.description ?? 'No description available.',
                style: const TextStyle(color: Colors.white70, fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => NewsWebViewPage(url: article.url ?? ''),
                    ),
                  );
                },
                icon: const Icon(Icons.open_in_new),
                label: const Text('Open full article'),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  static String _formatDate(String raw) {
    try {
      final dt = DateTime.parse(raw);
      return '${dt.year}-${_two(dt.month)}-${_two(dt.day)}';
    } catch (_) {
      return raw;
    }
  }

  static String _two(int n) => n < 10 ? '0$n' : '$n';
}
