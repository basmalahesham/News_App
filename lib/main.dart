import 'package:flutter/material.dart';
import 'package:news_app/core/theme/app_theme.dart';
import 'package:news_app/layout/home_layout_view.dart';
import 'package:news_app/moduls/splash/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName: (context) => const SplashView(),
        HomeLayoutView.routeName: (context) => const HomeLayoutView(),
      },
    );
  }
}
