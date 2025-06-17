import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:online_shop_app/core/services/local_storage.dart';
import 'package:online_shop_app/features/settings/presentation/controller/localization_cubit/localization_states.dart';

class LocalizationCubit extends Cubit<LocalizationStates> {
  LocalizationCubit() : super(LocalizationInitialState());

  Locale currentLocale = const Locale('en');

  void changeCurrentLang( String languageCode) {
    currentLocale = Locale(languageCode);
    LocalStorage.setString(key: 'lang', value: currentLocale.languageCode).then((_) {
      emit(AppChangeLangState());
    });
  }

  void setInitialLang(Locale? locale) {
    if (locale != null) {
      currentLocale = locale;
      emit(AppChangeLangState());
    }
  }
}
