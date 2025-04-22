import 'package:flutter/material.dart';
import 'package:online_shop_app/core/services/google_place_service.dart';
import 'package:online_shop_app/features/google_maps/data/models/places_details_model/places_details_model.dart';
import 'package:online_shop_app/features/google_maps/data/models/places_model/places_model.dart';

class GoogleMapsListView extends StatelessWidget {
  const GoogleMapsListView({
    super.key,
    required this.places,
    required this.googlePlacesService,
    required this.onPlaceSelect,
  });

  final List<PlacesModel> places;
  final GooglePlaceService googlePlacesService;
  final void Function(PlacesDetailsModel) onPlaceSelect;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                var searchedPlace = await googlePlacesService.getPlaceDetails(
                  placeId: places[index].placeId.toString(),
                );
                onPlaceSelect(searchedPlace);
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
    );
  }
}
