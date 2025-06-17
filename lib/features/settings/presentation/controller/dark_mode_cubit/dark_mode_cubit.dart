import 'package:bloc/bloc.dart';
import 'package:online_shop_app/core/services/local_storage.dart';
import 'package:online_shop_app/features/settings/presentation/controller/dark_mode_cubit/dark_mode_states.dart';

class DarkModeCubit extends Cubit<DarkModeStates> {
  DarkModeCubit() : super(SettingsInitialStates());

  bool isDark = false;

  void changeAppMode({bool? fromShared}){
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

}