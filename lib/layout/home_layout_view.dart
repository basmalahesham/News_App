import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/layout/widgets/custom_drawer.dart';

class HomeLayoutView extends StatefulWidget {
  const HomeLayoutView({super.key});

  static const String routeName = "home";

  @override
  State<HomeLayoutView> createState() => _HomeLayoutViewState();
}

class _HomeLayoutViewState extends State<HomeLayoutView> {
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
            'News App',
            style: GoogleFonts.exo(
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        drawer: const CustomDrawer(),
        body: Container(),
      ),
    );
  }
}
