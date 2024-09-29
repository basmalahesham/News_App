import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeMode themeMode = ThemeMode.light;
  static const Color primaryColor = Color(0xFF39A552);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      elevation: 1,
      backgroundColor: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
      ),
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: Colors.transparent,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedIconTheme: IconThemeData(
        color: primaryColor,
        size: 30,
      ),
      unselectedIconTheme: IconThemeData(
        color: Colors.grey,
        size: 30,
      ),
    ),
    /*textTheme: TextTheme(
      headlineMedium: GoogleFonts.poppins(
        fontWeight: FontWeight.bold,
        fontSize: 22,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 25,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: GoogleFonts.poppins(
        fontWeight: FontWeight.bold,
        fontSize: 14,
        color: Colors.black,
      ),
    ),*/
  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: primaryColor,
      centerTitle: false,
      titleTextStyle: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: Colors.transparent,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedIconTheme: IconThemeData(
        color: primaryColor,
        size: 30,
      ),
      unselectedIconTheme: IconThemeData(
        color: Colors.grey,
        size: 30,
      ),
    ),
    /*textTheme: TextTheme(
      headlineMedium: GoogleFonts.poppins(
        fontWeight: FontWeight.bold,
        fontSize: 22,
        color: darkColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 25,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: GoogleFonts.poppins(
        fontWeight: FontWeight.bold,
        fontSize: 14,
        color: Colors.white,
      ),
    ),*/
  );
}