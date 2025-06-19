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

  Future<dynamic> post({
    required body,
    required String url,
    required String token,
    String? contentType,
  }) async {
    var response = await dio.post(
      url,
      data: body,
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
    return response;
  }
}
