import 'package:flutter/material.dart';
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
      theme: ThemeData(),
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName:(context)=>SplashView(),
      },
    );
  }
}
