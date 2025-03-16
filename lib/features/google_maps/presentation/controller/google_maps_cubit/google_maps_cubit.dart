import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:online_shop_app/core/services/location_service.dart';
import 'package:online_shop_app/features/google_maps/presentation/controller/google_maps_cubit/google_maps_states.dart';

class GoogleMapsCubit extends Cubit<GoogleMapsStates> {
  GoogleMapsCubit() : super(GoogleMapsInitialStates());

  final CameraPosition initialCameraPosition = const CameraPosition(
    target: LatLng(27.055591836744718, 29.759822852555917),
    zoom: 4,
  );
  late LocationService locationService = LocationService();
  late GoogleMapController googleMapController;

  void updateCurrentLocation() async {
    try {
      var locationData = await locationService.getLocation();
      CameraPosition myCurrentLocation = CameraPosition(
        target: LatLng(locationData.latitude!, locationData.longitude!),
        zoom: 16,
      );

      googleMapController
          .animateCamera(CameraUpdate.newCameraPosition(myCurrentLocation));
      emit(GoogleMapsLocationSuccessStates());
    } on LocationServiceException catch (e) {
      emit(GoogleMapsLocationServiceException(e.toString()));
      log(e.toString());
    } on LocationPermissionException catch (e) {
      emit(GoogleMapsLocationPermissionException(e.toString()));
      log(e.toString());
    } catch (e) {
      emit(GoogleMapsLocationFailureStates(e.toString()));
      log(e.toString());
    }
  }
}
