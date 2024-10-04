import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/layout/widgets/custom_drawer.dart';
import 'package:news_app/layout/widgets/grid_view_item_builder.dart';
import 'package:news_app/layout/widgets/news_view.dart';
import 'package:news_app/models/category_model.dart';

class HomeLayoutView extends StatefulWidget {
  const HomeLayoutView({super.key});

  static const String routeName = "home";

  @override
  State<HomeLayoutView> createState() => _HomeLayoutViewState();
}

class _HomeLayoutViewState extends State<HomeLayoutView> {
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

  @override
  Widget build(BuildContext context) {
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
          iconTheme: const IconThemeData(
            color: Colors.white,
            size: 25,
          ),
          title: Text(
            selectedCategory == null ? 'News App' : selectedCategory!.title,
            style: GoogleFonts.exo(
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
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
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: const Color(0xFF4F5A69),
                      ),
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
                        itemCount: categoriesList.length,
                      ),
                    ),
                  ],
                ),
              )
            : NewsView(categoryModel: selectedCategory!),
      ),
    );
  }

  CategoryModel? selectedCategory;

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
