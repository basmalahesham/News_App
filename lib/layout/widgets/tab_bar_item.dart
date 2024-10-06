import 'package:flutter/material.dart';
import 'package:news_app/models/source_model.dart';

class TabBarItem extends StatelessWidget {
  final SourceModel sourceModel;
  bool isSelected;

   TabBarItem({
    super.key,
    required this.sourceModel,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      decoration: BoxDecoration(
        color: isSelected ? theme.primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(25.0),
        border: Border.all(
          color: theme.primaryColor,
          width: 2,
        ),
      ),
      child: Text(
        sourceModel.name,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: isSelected ? Colors.white : theme.primaryColor,
        ),
      ),
    );
  }
}
