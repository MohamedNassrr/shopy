import 'package:flutter/material.dart';

class TTextTheme{

  static TextTheme lightTextTheme = const TextTheme(
    titleMedium:  TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    bodyLarge:  TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    bodySmall:  TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    labelSmall: TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w400,
      color: Color(0xffC8C8CB),
    ),
    displaySmall: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      color: Colors.grey,
    ),
  );
  static TextTheme darkTextTheme = const TextTheme(
    titleMedium:  TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    bodyLarge:  TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    bodySmall:  TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    labelSmall: TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w400,
      color: Color(0xffC8C8CB),
    ),
  );
}