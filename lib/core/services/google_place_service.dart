import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:online_shop_app/features/google_maps/data/models/places_details_model/places_details_model.dart';
import 'package:online_shop_app/features/google_maps/data/models/places_model/places_model.dart';

class GooglePlaceService{
  final Dio dio = Dio();
  final String baseUrl = 'https://maps.googleapis.com/maps/api/place';

  Future<List<PlacesModel>> getPredict({required String input}) async {
    var response  = await dio.get(
      '$baseUrl/autocomplete/json?key=${dotenv.env['PLACE_KEY']}&input=$input',
    );
    if(response.statusCode == 200){
      var data = response.data;
      List<PlacesModel> places = [];
      for(var item in data['predictions']){
        places.add(PlacesModel.fromJson(item));
      }
      return places;
    }else{
      throw Exception();
    }
  }
  Future<PlacesDetailsModel> getPlaceDetails({required String placeId}) async {
    var response = await dio.get(
      '$baseUrl/details/json?key=${dotenv.env['PLACE_KEY']}&place_id=$placeId',
    );
    if(response.statusCode == 200){
      var data = response.data['result'];
    return PlacesDetailsModel.fromJson(data);
    }else{
      throw Exception();
    }
  }
}
