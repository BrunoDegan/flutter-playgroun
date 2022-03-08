import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
  cardColor: const Color(0xFFEDF4F8),
  scaffoldBackgroundColor: const Color(0xFF121517),
  highlightColor: const Color(0xFF172026),
  primaryColor: const Color(0xFF055AA3),
  backgroundColor: const Color(0xFFD6DEF4),
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontFamily: "Poppins",
      fontSize: 20,
      fontWeight: FontWeight.w400,
    ),
    headline2: TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),
    bodyText1: TextStyle(
      fontFamily: "Montserrat",
      fontSize: 14,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal,
    ),
    headline3: TextStyle(
      fontFamily: "Montserrat",
      fontSize: 12,
      fontWeight: FontWeight.normal,
    ),
  ),
  iconTheme: const IconThemeData(color: Colors.white),
  primaryIconTheme: const IconThemeData(color: Colors.white),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: const Color(0xFF055AA3),
    ),
  ),
);

ThemeData darkTheme = ThemeData.dark().copyWith(
    cardColor: const Color(0xFF172026),
    scaffoldBackgroundColor: const Color(0xFF121517),
    highlightColor: const Color(0xFFEDF4F8),
    primaryColor: const Color(0xFF055AA3),
    backgroundColor: const Color(0xFF121517),
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontFamily: "Poppins",
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      headline2: TextStyle(
          fontFamily: "Poppins", fontWeight: FontWeight.w400, fontSize: 16),
      bodyText1: TextStyle(
          fontFamily: "Montserrat",
          fontSize: 14,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal),
      headline3: TextStyle(
        fontFamily: "Montserrat",
        fontSize: 12,
        fontWeight: FontWeight.normal,
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
        style: ElevatedButton.styleFrom(primary: const Color(0xFF055AA3))));
