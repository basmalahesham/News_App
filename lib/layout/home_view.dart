import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_app/layout/widgets/custom_drawer.dart';
import 'package:news_app/layout/widgets/grid_view_item_builder.dart';
import 'package:news_app/layout/category_view.dart';
import 'package:news_app/models/category_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  static const String routeName = "home";

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  List<CategoryModel> categoriesList = [
    CategoryModel(
      id: 'sports',
      title: 'Sports',
      image: 'assets/images/sports.png',
      backgroundColor: const Color(0xFFC91C22),
    ),
    CategoryModel(
      id: 'politics',
      title: 'Politics',
      image: 'assets/images/politics.png',
      backgroundColor: const Color(0xFF003E90),
    ),
    CategoryModel(
      id: 'health',
      title: 'Health',
      image: 'assets/images/health.png',
      backgroundColor: const Color(0xFFED1E70),
    ),
    CategoryModel(
      id: 'business',
      title: 'Business',
      image: 'assets/images/bussines.png',
      backgroundColor: const Color(0xFFCF7E48),
    ),
    CategoryModel(
      id: 'environment',
      title: 'Environment',
      image: 'assets/images/environment.png',
      backgroundColor: const Color(0xFF4882CF),
    ),
    CategoryModel(
      id: 'science',
      title: 'Science',
      image: 'assets/images/science.png',
      backgroundColor: const Color(0xFFF2D352),
    ),
  ];
  CategoryModel? selectedCategory;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage(
            'assets/images/pattern.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            selectedCategory == null ? 'News App' : selectedCategory!.title,
            style: theme.textTheme.bodyLarge,
          ),
          actions: [
            if (selectedCategory != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search_rounded,
                    size: 45,
                    color: Colors.white,
                  ),
                ),
              )
          ],
          leadingWidth: 80,
        ),
        drawer: CustomDrawer(
          selectedCategory: selectedCategory,
          onPressed: onPressed,
        ),
        body: selectedCategory == null
            ? Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pick your Category \n of interest',
                      textAlign: TextAlign.start,
                      style: theme.textTheme.bodyLarge?.copyWith(
                          color: const Color(0xFF4F5A69), height: 1.15),
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 15,
                          childAspectRatio: 7 / 8,
                        ),
                        itemBuilder: (context, index) => GridViewItemBuilder(
                          categoryModel: categoriesList[index],
                          index: index,
                          onClicked: onClicked,
                        ),
                        itemCount: 6,
                      ),
                    ),
                  ],
                ),
              )
            : CategoryView(categoryModel: selectedCategory!),
      ),
    );
  }

  onClicked(CategoryModel categoryModel) {
    log(categoryModel.title);
    selectedCategory = categoryModel;
    setState(() {});
  }

  onPressed() {
    setState(() {
      selectedCategory = null;
      Navigator.pop(context);
    });
  }
}
