import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:online_shop_app/core/services/geo_coding_service.dart';
import 'package:online_shop_app/core/services/google_place_service.dart';
import 'package:online_shop_app/core/services/location_service.dart';
import 'package:online_shop_app/core/styles/constance.dart';
import 'package:online_shop_app/core/widgets/custom_text_field.dart';
import 'package:online_shop_app/features/google_maps/data/models/places_model/places_model.dart';
import 'package:online_shop_app/features/google_maps/presentation/controller/google_maps_cubit/google_maps_cubit.dart';
import 'package:online_shop_app/features/google_maps/presentation/controller/google_maps_cubit/google_maps_states.dart';
import 'package:online_shop_app/features/google_maps/presentation/views/widgets/google_maps_list_view.dart';
import 'package:uuid/uuid.dart';

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
  late Uuid uuid;
  String? sessionToken;
  List<PlacesModel> places = [];

  @override
  void initState() {
    searchController = TextEditingController();
    googlePlaceService = GooglePlaceService();
    locationService = LocationService();
    uuid = const Uuid();
    geoCodingService = GeoCodingService();
    super.initState();
    fetchPrediction();
  }

  void fetchPrediction() {
    searchController.addListener(() async {
      sessionToken ??= uuid.v4();
      debugPrint(sessionToken);
      if (searchController.text.isNotEmpty) {
        var result = await googlePlaceService.getPredict(
          sessionToken: sessionToken!,
          input: searchController.text,
        );

        places.clear();
        places.addAll(result);
        setState(() {});
      } else {
        places.clear();
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mapsCubit = BlocProvider.of<GoogleMapsCubit>(context);
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
                top: 16,
                left: 16,
                right: 16,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: searchController,
                      hintText: 'Delivery address',
                      fillColor: Colors.white,
                      isFilled: true,
                      suffixIcon: Icons.clear,
                      suffixPressed: () {
                        searchController.clear();
                      },
                    ),
                    GoogleMapsListView(
                      googlePlacesService: googlePlaceService,
                      places: places,
                      onPlaceSelect: (placeDetailsModel) {
                        searchController.clear();
                        places.clear();
                        setState(() {});
                        mapsCubit.setCurrentLocation(
                          latitude: placeDetailsModel.geometry!.location!.lat!,
                          longitude: placeDetailsModel.geometry!.location!.lng!,
                        );
                        sessionToken = null;
                        setState(() {});
                      },
                    ),
                  ],
                )),
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(primaryColor)),
                onPressed: () async {
                  var locationData = await locationService.getLocation();
                  final placeName = await geoCodingService.getGeoCoding(
                    latitude: locationData.latitude!,
                    longitude: locationData.longitude!,
                  );

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
