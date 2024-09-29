import 'package:flutter/material.dart';

class HomeLayoutView extends StatefulWidget {
  const HomeLayoutView({super.key});

  static const String routeName = "home";

  @override
  State<HomeLayoutView> createState() => _HomeLayoutViewState();
}

class _HomeLayoutViewState extends State<HomeLayoutView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
