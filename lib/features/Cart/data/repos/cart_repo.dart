import 'package:dartz/dartz.dart';
import 'package:online_shop_app/core/errors/apis_failures.dart';
import 'package:online_shop_app/features/Cart/data/models/cart_model/cart_model.dart';

abstract class CartRepo{
  Future<Either<ApisFailure,List<CartModel>>> fetchCartItems();
}