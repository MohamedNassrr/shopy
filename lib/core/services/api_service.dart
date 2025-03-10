import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();
  final String baseUrl = 'https://dummyjson.com';

  Future<Map<String,dynamic>> getProduct({required String endPoint}) async {
    var response = await dio.get(
      '$baseUrl$endPoint',
    );

    return response.data;
  }
}
