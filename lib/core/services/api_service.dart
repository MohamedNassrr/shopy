import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();
  final String baseUrl = 'https://dummyjson.com';

  Future<dynamic> get({required String endPoint}) async {
    Response response = await dio.get(
      '$baseUrl$endPoint',
    );

    return response.data;
  }
}
