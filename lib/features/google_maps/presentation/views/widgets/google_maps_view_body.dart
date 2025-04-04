import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:online_shop_app/core/styles/constance.dart';
import 'package:online_shop_app/core/widgets/custom_text_field.dart';
import 'package:online_shop_app/features/google_maps/presentation/controller/google_maps_cubit/google_maps_cubit.dart';
import 'package:online_shop_app/features/google_maps/presentation/controller/google_maps_cubit/google_maps_states.dart';

class GoogleMapsViewBody extends StatelessWidget {
  const GoogleMapsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    var searchCubit = BlocProvider.of<GoogleMapsCubit>(context);

    searchController.addListener(() async {

    });

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
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return const Text('data');
                      },
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: 3,
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
