import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:online_shop_app/features/settings/presentation/controller/localization_cubit/localization_states.dart';

class LocalizationCubit extends Cubit<LocalizationStates> {
  LocalizationCubit() : super(LocalizationInitialState());


  Locale currentLocale = const Locale('en');

  void changeCurrentLang(String languageCode){
    currentLocale = Locale(languageCode);
    emit(AppChangeLangState());
  }
}