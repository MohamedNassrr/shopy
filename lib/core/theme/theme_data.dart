import 'package:flutter/material.dart';
import 'package:online_shop_app/constance.dart';
import 'package:online_shop_app/core/theme/custom_themes/app_bar_theme.dart';
import 'package:online_shop_app/core/theme/custom_themes/bot_nav_bar_theme.dart';
import 'package:online_shop_app/core/theme/custom_themes/elevated_bottom_theme.dart';
import 'package:online_shop_app/core/theme/custom_themes/icon_theme.dart';
import 'package:online_shop_app/core/theme/custom_themes/text_theme.dart';

class TAppTheme{

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme: TElevatedBottomTheme.lightElevatedBottomTheme,
    appBarTheme: TAppBarTheme.lightAppBar,
    iconTheme: TIconTheme.lightIconTheme,
    bottomNavigationBarTheme: TBotNavBarTheme.lightBotNavBar,
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.black,
    textTheme: TTextTheme.darkTextTheme,
    elevatedButtonTheme: TElevatedBottomTheme.darkElevatedBottomTheme,
    appBarTheme: TAppBarTheme.darkAppBar,
    iconTheme: TIconTheme.darkIconTheme,
    bottomNavigationBarTheme: TBotNavBarTheme.darkBotNavBar,
  );
}