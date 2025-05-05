import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_shop_app/constance.dart';
import 'package:online_shop_app/core/utils/assets_data.dart';
import 'package:online_shop_app/features/google_maps/data/models/places_model/places_model.dart';

import 'widgets/google_maps_view_body.dart';

class GoogleMapsView extends StatelessWidget {
  const GoogleMapsView({super.key, required this.placesModel });
  final PlacesModel placesModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Image.asset(AssetsData.logoIcon),
        actions: [
          TextButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            child:  const Text(
              'cancel',
              style: TextStyle(
                color: primaryColor
              ),
            ),
          ),
        ],
      ),
      body:  const GoogleMapsViewBody(),
    );
  }
}
