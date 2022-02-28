import 'package:flutter/material.dart';

ThemeData lightTheme(String fontFamily) {
  return ThemeData.light().copyWith(
    primaryColor: const Color(0xFF055AA3),
    backgroundColor: const Color(0xFF055AA3),
    cardTheme: const CardTheme(
      color: Color(0xFFEDF4F4),
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontFamily: fontFamily,
        color: const Color(0xFFEDF4F8),
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      bodyText1: const TextStyle(
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal,
          color: Colors.white,
          fontSize: 16),
      bodyText2: TextStyle(
        fontFamily: fontFamily,
        color: const Color(0xFFEDF4F8),
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: const TextStyle(
        fontSize: 18.0,
        color: Colors.white,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.8,
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    primaryIconTheme: const IconThemeData(color: Colors.white),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: const Color(0xFF055AA3),
      ),
    ),
  );
}

ThemeData darkTheme(String fontFamily) {
  return ThemeData.dark().copyWith(
    primaryColor: const Color(0xFF055AA3),
    backgroundColor: const Color(0xFF055AA3),
    cardTheme: const CardTheme(
      color: Color(0xFFEDF4F4),
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontFamily: fontFamily,
        color: const Color(0xFFEDF4F8),
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      bodyText1: const TextStyle(
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal,
          color: Colors.white,
          fontSize: 16),
      bodyText2: TextStyle(
        fontFamily: fontFamily,
        color: const Color(0xFFEDF4F8),
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: const TextStyle(
        fontSize: 18.0,
        color: Colors.white,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.8,
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    primaryIconTheme: const IconThemeData(color: Colors.white),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black,
    ),
  );
}
