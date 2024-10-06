import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';

class GridViewItemBuilder extends StatelessWidget {
  const GridViewItemBuilder({
    super.key,
    required this.categoryModel,
    required this.index,
    required this.onClicked,
  });

  final CategoryModel categoryModel;
  final int index;
  final Function onClicked;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        onClicked(categoryModel);
      },
      child: Container(
        decoration: BoxDecoration(
          color: categoryModel.backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(25),
            topRight: const Radius.circular(25),
            bottomRight:
                index % 2 == 0 ? const Radius.circular(0) : const Radius.circular(25),
            bottomLeft:
                index % 2 == 0 ? const Radius.circular(25) : const Radius.circular(0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(categoryModel.image),
            const SizedBox(
              height: 6,
            ),
            Text(
              categoryModel.title,
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
