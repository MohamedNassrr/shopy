abstract class HomeStates {}

class HomeInitialStates extends HomeStates {}


class HomeSetLocationNameStates extends HomeStates {
  final String locationName;

  HomeSetLocationNameStates(this.locationName);
}

class HomeLoadingStates extends HomeStates {}

class HomeSuccessStates extends HomeStates {}

class HomeChangeNavStates extends HomeStates {}

class HomeFailureStates extends HomeStates {
  final String error;

  HomeFailureStates(this.error);
}
