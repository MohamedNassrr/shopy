abstract class HomeStates {}

class HomeInitialStates extends HomeStates {}

class HomeLoadingStates extends HomeStates {}

class HomeSuccessStates extends HomeStates {}

class HomeFailureStates extends HomeStates {
  final String error;

  HomeFailureStates(this.error);
}
