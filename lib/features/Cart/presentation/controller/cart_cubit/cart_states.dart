import 'package:online_shop_app/features/Cart/data/models/cart_model/cart_model.dart';

abstract class CartStates {}

class CartInitialStates extends CartStates {}

class CartLoadingStates extends CartStates {}

class CartSuccessStates extends CartStates {
  final List<CartModel> cart;

  CartSuccessStates(this.cart);
}

class CartCounterAddStates extends CartStates {}

class CartCounterMinusStates extends CartStates {}

class CartFailureStates extends CartStates {
  final String failure;

  CartFailureStates(this.failure);
}


