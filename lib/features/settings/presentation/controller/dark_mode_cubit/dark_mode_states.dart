abstract class DarkModeStates {
  final bool isLight;

  DarkModeStates({required this.isLight});
}

class SettingsInitialStates extends DarkModeStates {
  SettingsInitialStates({required super.isLight});

}

class AppModeChangedStates extends DarkModeStates {
  AppModeChangedStates({required super.isLight});
}



