import 'package:flutter/material.dart';
import 'package:news_app/core/network/api_manager.dart';
import 'package:news_app/layout/widgets/news_artical_item.dart';
import 'package:news_app/models/articals_model.dart';
import 'package:news_app/models/source_model.dart';

class NewsArticalsList extends StatelessWidget {
  final Sources source;

  const NewsArticalsList({
    super.key,
    required this.source,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ArticalsModel>(
      future: ApiManager.fetchArticals(source.id!),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        List<Articles> articalsList = snapshot.data?.articles ?? [];
        return ListView.builder(
          padding: const EdgeInsets.all(20),
          itemBuilder: (context, index) => NewsArticalItem(
            articles: articalsList[index],
          ),
          itemCount: articalsList.length,
        );
      },
    );
  }
}
