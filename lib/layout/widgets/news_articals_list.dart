import 'package:flutter/material.dart';
import 'package:news_app/core/network/api_manager.dart';
import 'package:news_app/layout/widgets/news_artical_item.dart';
import 'package:news_app/models/article_model.dart';

class NewsArticalsList extends StatelessWidget {
  final String sourceId;

  const NewsArticalsList({
    super.key,
    required this.sourceId,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.fetchArticals(sourceId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        List<ArticleModel> articalsList = snapshot.data??[];
        return ListView.builder(
          padding: const EdgeInsets.all(20),
          itemBuilder: (context, index) => NewsArticalItem(
            articleModel: articalsList[index],
          ),
          itemCount: articalsList.length,
        );
      },
    );
  }
}
