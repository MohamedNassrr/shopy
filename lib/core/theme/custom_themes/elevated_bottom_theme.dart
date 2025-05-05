import 'package:flutter/material.dart';
import 'package:online_shop_app/constance.dart';

class TElevatedBottomTheme {
  static final lightElevatedBottomTheme = const ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(primaryColor),
    ),
  );

  static final darkElevatedBottomTheme = const ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(Colors.white),
    ),
  );
}
