abstract class GoogleMapsStates{}

class GoogleMapsInitialStates extends GoogleMapsStates{}

class GoogleMapsLocationSuccessStates extends GoogleMapsStates{}

class GoogleMapsLocationFailureStates extends GoogleMapsStates{
  final String errMessage;

  GoogleMapsLocationFailureStates(this.errMessage);
}

class GoogleMapsLocationPermissionException extends GoogleMapsStates{
  final String errMessage;

  GoogleMapsLocationPermissionException(this.errMessage);
}

class GoogleMapsLocationServiceException extends GoogleMapsStates{
  final String errMessage;

  GoogleMapsLocationServiceException(this.errMessage);
}