import 'package:online_shop_app/features/google_maps/data/models/places_model/places_model.dart';

abstract class GoogleMapsStates {}

class GoogleMapsInitialStates extends GoogleMapsStates {}

class GoogleMapsLocationSuccessStates extends GoogleMapsStates {}

class GoogleMapsLocationFailureStates extends GoogleMapsStates {
  final String error;

  GoogleMapsLocationFailureStates(this.error);
}

class GoogleMapsLocationServiceException extends GoogleMapsStates {
  final String error;

  GoogleMapsLocationServiceException(this.error);
}

class GoogleMapsLocationPermissionException extends GoogleMapsStates {
  final String error;

  GoogleMapsLocationPermissionException(this.error);
}

class GoogleMapSearchLoadingStates extends GoogleMapsStates {} // Add loading state

class GoogleMapSearchRefreshedStates extends GoogleMapsStates {
  final List<PlacesModel> places;

  GoogleMapSearchRefreshedStates(this.places);
}

class GoogleMapSearchErrorStates extends GoogleMapsStates{
  final String error;
  GoogleMapSearchErrorStates(this.error);
}