import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:online_shop_app/constance.dart';
import 'package:online_shop_app/core/services/geo_coding_service.dart';
import 'package:online_shop_app/core/services/google_place_service.dart';
import 'package:online_shop_app/core/services/location_service.dart';
import 'package:online_shop_app/features/google_maps/data/models/places_model/places_model.dart';
import 'package:online_shop_app/features/google_maps/presentation/controller/google_maps_cubit/google_maps_cubit.dart';
import 'package:online_shop_app/features/google_maps/presentation/controller/google_maps_cubit/google_maps_states.dart';

class GoogleMapsViewBody extends StatefulWidget {
  const GoogleMapsViewBody({super.key});

  @override
  State<GoogleMapsViewBody> createState() => _GoogleMapsViewBodyState();
}

class _GoogleMapsViewBodyState extends State<GoogleMapsViewBody> {
  late TextEditingController searchController;
  late GooglePlaceService googlePlaceService;
  late GeoCodingService geoCodingService;
  late LocationService locationService;
  String? sessionToken;
  List<PlacesModel> places = [];

  @override
  void initState() {
    searchController = TextEditingController();
    googlePlaceService = GooglePlaceService();
    locationService = LocationService();
    geoCodingService = GeoCodingService();
    super.initState();
  }



  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mapsCubit = context.watch<GoogleMapsCubit>();
    return BlocBuilder<GoogleMapsCubit, GoogleMapsStates>(
      builder: (context, state) {
        return Stack(
          children: [
            GoogleMap(
              markers: mapsCubit.markers,
              initialCameraPosition: mapsCubit.initialCameraPosition,
              zoomControlsEnabled: false,
              onMapCreated: (controller) {
                mapsCubit.googleMapController = controller;
                mapsCubit.updateCurrentLocation();
              },
            ),
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: ElevatedButton(
                 onPressed: () async {
                  var locationData = await locationService.getLocation();
                  final placeName = await geoCodingService.getGeoCoding(
                    latitude: locationData.latitude!,
                    longitude: locationData.longitude!,
                  );

                  // ignore: use_build_context_synchronously
                  GoRouter.of(context).pop({
                    'placeName': placeName[0].formattedAddress,
                  });
                },
                child: Text(
                  'confirm location'.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 77,
              right: 10,
              child: FloatingActionButton(
                backgroundColor: Colors.white,
                onPressed: () {
                  mapsCubit.updateCurrentLocation();
                },
                child: const Icon(
                  Icons.pin_drop,
                  color: primaryColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
