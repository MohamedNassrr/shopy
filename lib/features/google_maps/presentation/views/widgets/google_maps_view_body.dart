import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:online_shop_app/core/widgets/custom_text_field.dart';
import 'package:online_shop_app/features/google_maps/presentation/controller/google_maps_cubit/google_maps_cubit.dart';
import 'package:online_shop_app/features/google_maps/presentation/controller/google_maps_cubit/google_maps_states.dart';

class GoogleMapsViewBody extends StatelessWidget {
  const GoogleMapsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoogleMapsCubit, GoogleMapsStates>(
      builder: (context, state) {
        var cubit = BlocProvider.of<GoogleMapsCubit>(context);
        return Stack(
          children: [
            GoogleMap(
              initialCameraPosition: cubit.initialCameraPosition,
              zoomControlsEnabled: false,
              onMapCreated: (controller) {
                cubit.googleMapController = controller;
                cubit.updateCurrentLocation();
              },
            ),
            const Positioned(
                top: 16,
                left: 16,
                right: 16,
                child: CustomTextField(
                  hintText: 'Delivery address',
                  fillColor: Colors.white,
                  isFilled: true,
                )),
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('confirm location'.toUpperCase()),
              ),
            ),
            Positioned(
              bottom: 77,
              right: 10,
              child: FloatingActionButton(
                backgroundColor: Colors.white,
                onPressed: (){
                  cubit.updateCurrentLocation();
                },
                child: const Icon(Icons.pin_drop),
              ),
            )
          ],
        );
      },
    );
  }
}
