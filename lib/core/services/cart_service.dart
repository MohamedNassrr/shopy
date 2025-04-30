import 'package:dio/dio.dart';
import 'package:online_shop_app/features/Cart/data/models/carts_model/carts_model.dart';
import 'package:online_shop_app/features/Cart/data/models/carts_model/product.dart';

class CartService{
  final Dio dio = Dio();
  final String baseUrl = 'https://dummyjson.com/carts/add';

  final cartsModel = CartsModel(
    id: 51,
    userId:1,
    products: [
      Product(id: 144,quantity: 4),
      Product(id: 98,quantity: 1),
    ],
  );

  Future<Map<String,dynamic>> post({
    String contentType = 'application/json',
  }) async{
    Response response = await dio.post(
      baseUrl,
      data: cartsModel.toJson(),
      options: Options(
        contentType: contentType,
      ),
    );
    return response.data;
  }
}