import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:online_shop_app/core/errors/apis_failures.dart';
import 'package:online_shop_app/core/services/cart_service.dart';
import 'package:online_shop_app/features/Cart/data/models/carts_model/carts_model.dart';
import 'package:online_shop_app/features/Cart/data/repos/cart_repo.dart';

class CartRepoImpl implements CartRepo {
  final CartService cartService;

  CartRepoImpl(this.cartService);

  @override
  Future<Either<ApisFailure, CartsModel>> fetchCartItems() async{
    try {
      var data = await cartService.post();
      CartsModel cart = CartsModel.fromJson(data);
      return right(cart);
    } catch (e) {
      if(e is DioException){
        return left(ServerFailures.fromDioError(e));

      }
      return left(ServerFailures(e.toString()));
    }

  }
  
}
