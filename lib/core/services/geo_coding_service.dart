import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:online_shop_app/features/google_maps/data/models/geo_coding_model/geo_coding_model.dart';

class GeoCodingService {
  final Dio dio = Dio();

  final String baseUrl = 'https://maps.googleapis.com/maps/api/geocode/json';

  Future<List<GeoCodingModel>> getGeoCoding({required double latitude,required double longitude,}) async {
    var response = await dio.get(
      '$baseUrl?latlng=$latitude,%20$longitude&key=${dotenv.env['PLACE_KEY']}',
    );

    if (response.statusCode == 200) {
      var result = response.data;
      List<GeoCodingModel> geoCoding = [];
      for (var item in result['results']) {
        geoCoding.add(GeoCodingModel.fromJson(item));
      }
      return geoCoding;
    } else {
      throw Exception();
    }
  }
}
