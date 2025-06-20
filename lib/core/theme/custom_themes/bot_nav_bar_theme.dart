import 'package:flutter/material.dart';
import 'package:online_shop_app/constance.dart';

class TBotNavBarTheme{

  static final lightBotNavBar =  const BottomNavigationBarThemeData(
    selectedItemColor: primaryColor,
    backgroundColor: Colors.white,
  );
  static final darkBotNavBar =  const BottomNavigationBarThemeData(
    selectedItemColor: Colors.white,
    backgroundColor: Color(0xff1c1c1c),
  );
}