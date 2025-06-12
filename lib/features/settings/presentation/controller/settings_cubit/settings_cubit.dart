import 'package:bloc/bloc.dart';
import 'package:online_shop_app/features/settings/presentation/controller/settings_cubit/settings_states.dart';

class SettingsCubit extends Cubit<SettingsStates> {
  SettingsCubit() : super(SettingsInitialStates());

  bool isLight = true;

  void changeAppMode({bool? fromShared}){
    if(fromShared != null){
      isLight = fromShared;
      emit(AppModeChangedStates());
    }else{
      isLight = !isLight;
      emit(AppModeChangedStates());
    }

  }
}