import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:online_shop_app/features/settings/presentation/controller/localization_cubit/localization_states.dart';

class LocalizationCubit extends HydratedCubit<LocalizationStates> {
  LocalizationCubit() : super(LocalizationInitialState(locale: const Locale('en')));



  void changeCurrentLang(String languageCode){
    emit(AppChangeLangState(locale: Locale(languageCode)));
  }

  @override
  LocalizationStates? fromJson(Map<String, dynamic> json) {
   final langCode = json["lang"] as String?;
   if(langCode == null) return null;
     return AppChangeLangState(locale: Locale(langCode));
  }

  @override
  Map<String, dynamic>? toJson(LocalizationStates state) {
   return {"lang": state.locale.languageCode};
  }
}