import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/layout/article_details_view.dart';
import 'package:news_app/models/article_model.dart';

class NewsArticalItem extends StatelessWidget {
  final ArticleModel articleModel;

  const NewsArticalItem({
    super.key,
    required this.articleModel,
  });

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.sizeOf(context);
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ArticleDetailsView.routeName,
          arguments: articleModel,
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 230,
              width: mediaQuery.width,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: CachedNetworkImage(
                imageUrl: articleModel.urlToImage,
                imageBuilder: (context, imageProvider) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                  );
                },
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: Colors.grey,
                  size: 45,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              articleModel.source.name,
              textAlign: TextAlign.start,
              style: theme.textTheme.bodySmall?.copyWith(
                color: const Color(0xFF79828B),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              articleModel.title,
              textAlign: TextAlign.start,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: const Color(0xFF42505C),
                fontSize: 18,
                height: 1.1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
