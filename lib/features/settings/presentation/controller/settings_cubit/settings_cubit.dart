import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:online_shop_app/core/services/local_storage.dart';
import 'package:online_shop_app/features/settings/presentation/controller/settings_cubit/settings_states.dart';

class SettingsCubit extends Cubit<SettingsStates> {
  SettingsCubit() : super(SettingsInitialStates());

  bool isDark = false;

  Future<void> setAppMode({bool? fromShared}) async{
    if(fromShared != null){
      isDark = fromShared;
    }else{
      isDark = !isDark;
      await LocalStorage.setBool(key: 'isDark', value: isDark);
    }
    emit(AppThemeChangedState());
  }



  Locale currentLocale = const Locale('en');

  Future<void> changeCurrentLang( String languageCode) async{
    currentLocale = Locale(languageCode);
    await LocalStorage.setString(key: 'lang', value: currentLocale.languageCode);
    emit(AppLocaleChangedState());
  }

  void setInitialLang(Locale? locale)async  {
    if (locale != null) {
      currentLocale = locale;
      emit(AppLocaleChangedState());
    }
  }
}

