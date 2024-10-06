import 'package:flutter/material.dart';
import 'package:news_app/core/network/api_manager.dart';
import 'package:news_app/layout/widgets/news_details.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/models/source_model.dart';

class CategoryView extends StatefulWidget {
  final CategoryModel categoryModel;

  const CategoryView({
    super.key,
    required this.categoryModel,
  });

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return FutureBuilder(
      future: ApiManager.fetchSources(widget.categoryModel.id),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
              snapshot.error.toString(),
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.black,
              ),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        List<SourceModel> sourcesList = snapshot.data ?? [];
        return NewsDetails(sourcesList: sourcesList);
      },
    );
  }
}
