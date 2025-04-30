import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:online_shop_app/core/errors/apis_failures.dart';
import 'package:online_shop_app/core/services/cart_service.dart';
import 'package:online_shop_app/features/Cart/data/models/cart_model/cart_model.dart';
import 'package:online_shop_app/features/Cart/data/repos/cart_repo.dart';

class CartRepoImpl implements CartRepo {
  final CartService cartService;

  CartRepoImpl(this.cartService);

  @override
  Future<Either<ApisFailure, List<CartModel>>> fetchCartItems() async {
    try {
      var data = await cartService.getCartItems(endPoint: '/carts');
      List<CartModel> cartModel = [];
      for (var cart in data['carts']) {
        try {
          cartModel.add(CartModel.fromJson(cart));
        } catch (e) {
          cartModel.add(CartModel.fromJson(cart));
        }
      }
      return right(cartModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailures.fromDioError(e));

      }
      return left(ServerFailures(e.toString()));
    }
  }
}
