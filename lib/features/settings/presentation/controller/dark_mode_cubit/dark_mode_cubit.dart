import 'package:bloc/bloc.dart';
import 'package:online_shop_app/features/settings/presentation/controller/dark_mode_cubit/dark_mode_states.dart';

class DarkModeCubit extends Cubit<DarkModeStates> {
  DarkModeCubit() : super(SettingsInitialStates());

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