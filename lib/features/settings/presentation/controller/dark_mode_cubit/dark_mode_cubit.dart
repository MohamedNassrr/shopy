import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:online_shop_app/features/settings/presentation/controller/dark_mode_cubit/dark_mode_states.dart';

class DarkModeCubit extends HydratedCubit<DarkModeStates> {
  DarkModeCubit() : super(SettingsInitialStates(isLight: true));

  void changeAppMode({required bool fromShared}){
   emit(AppModeChangedStates(isLight:fromShared));

  }

  @override
  DarkModeStates? fromJson(Map<String, dynamic> json) {
    final lightMode = json["darkMode"] as bool?;
    if(lightMode == null)return null;
    return AppModeChangedStates(isLight: lightMode);
  }

  @override
  Map<String, dynamic>? toJson(DarkModeStates state) {
   return {"darkMode":state.isLight};
  }

}