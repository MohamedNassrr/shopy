import 'package:flutter/material.dart';

abstract class LocalizationStates {
  final Locale locale;

  LocalizationStates({required this.locale});
}

class LocalizationInitialState extends LocalizationStates {
  LocalizationInitialState({required super.locale});
}

class AppChangeLangState extends LocalizationStates {
  AppChangeLangState({required super.locale});


}