import 'package:flutter/material.dart';
import 'package:online_shop_app/core/bootstrap.dart';
import 'package:online_shop_app/core/services/local_storage.dart';
import 'package:online_shop_app/shopy.dart';

void main() async {
  await bootStrap();
  bool? isDark = LocalStorage.getBool(key: 'isDark');
  final langCode = LocalStorage.getString(key: 'lang');
  final Locale savedLocale = langCode != null ? Locale(langCode) : const Locale('en');
  runApp(Shopy(isDark,savedLocale));
}

