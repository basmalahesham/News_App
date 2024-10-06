import 'package:flutter/material.dart';
import 'package:news_app/layout/widgets/tab_bar_item.dart';
import 'package:news_app/models/source_model.dart';

class NewsDetails extends StatefulWidget {
  final List<SourceModel> sourcesList;

  const NewsDetails({
    super.key,
    required this.sourcesList,
  });

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourcesList.length,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: TabBar(
              labelPadding: const EdgeInsets.symmetric(horizontal: 4),
              indicator: const BoxDecoration(
                border: Border(
                  bottom: BorderSide.none,
                ),
              ),
              dividerColor: Colors.transparent,
              isScrollable: true,
              onTap: (int index) {
                selectedIndex = index;
                setState(() {});
              },
              tabs: widget.sourcesList
                  .map(
                    (e) => TabBarItem(
                  sourceModel: e,
                  isSelected: selectedIndex == widget.sourcesList.indexOf(e),
                ),
              )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
