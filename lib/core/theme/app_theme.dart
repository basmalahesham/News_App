import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeMode themeMode = ThemeMode.light;
  static const Color primaryColor = Color(0xFF39A552);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 25,
      ),
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
    textTheme: TextTheme(
      titleLarge: GoogleFonts.exo(
        fontWeight: FontWeight.bold,
        fontSize: 24,
        color: Colors.white,
      ),
      bodyLarge: GoogleFonts.exo(
        fontWeight: FontWeight.bold,
        fontSize: 22,
        color: Colors.white,
      ),
      bodyMedium: GoogleFonts.exo(
        fontWeight: FontWeight.w500,
        fontSize: 22,
        color: Colors.white,
      ),
      bodySmall: GoogleFonts.exo(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Colors.white,
      ),
      displayLarge: GoogleFonts.exo(
        fontWeight: FontWeight.w500,
        fontSize: 10,
        color: Colors.white,
      ),
    ),
  );
}
