import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:online_shop_app/core/services/google_place_service.dart';
import 'package:online_shop_app/core/styles/constance.dart';
import 'package:online_shop_app/core/widgets/custom_text_field.dart';
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
  List<PlacesModel> places = [];

  @override
  void initState() {
    searchController = TextEditingController();
    googlePlaceService = GooglePlaceService();
    super.initState();
    fetchPrediction();
  }

  void fetchPrediction() {
    searchController.addListener(() async {
      if (searchController.text.isNotEmpty) {
        var result = await googlePlaceService.getPredict(
          input: searchController.text,
        );

        places.clear();
        places.addAll(result);
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
    var searchCubit = BlocProvider.of<GoogleMapsCubit>(context);
    return BlocBuilder<GoogleMapsCubit, GoogleMapsStates>(
      builder: (context, state) {
        return Stack(
          children: [
            GoogleMap(
              markers: searchCubit.markers,
              initialCameraPosition: searchCubit.initialCameraPosition,
              zoomControlsEnabled: false,
              onMapCreated: (controller) {
                searchCubit.googleMapController = controller;
                searchCubit.updateCurrentLocation();
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
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: const Icon(Icons.location_on_rounded),
                            title: Text(places[index].description!),
                            trailing: IconButton(
                              onPressed: () async {
                                var searchedPlace =
                                    await googlePlaceService.getPlaceDetails(
                                  placeId: places[index].placeId.toString(),
                                );
                               
                              },
                              icon: const Icon(Icons.chevron_right_outlined),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                          child: Divider(),
                        ),
                        itemCount: places.length,
                      ),
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
                onPressed: () {},
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
                  searchCubit.updateCurrentLocation();
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
