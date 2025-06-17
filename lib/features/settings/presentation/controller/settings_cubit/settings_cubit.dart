import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:online_shop_app/core/services/local_storage.dart';
import 'package:online_shop_app/features/settings/presentation/controller/settings_cubit/settings_states.dart';

class SettingsCubit extends Cubit<SettingsStates> {
  SettingsCubit() : super(SettingsInitialStates());

  bool isDark = false;

  void setAppMode({bool? fromShared}){
    if(fromShared != null){
      isDark = fromShared;
      emit(AppModeChangedStates());
    }else{
      isDark = !isDark;
      LocalStorage.setBool(key: 'isDark', value: isDark).then((_){
        emit(AppModeChangedStates());
      });
    }

  }



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

