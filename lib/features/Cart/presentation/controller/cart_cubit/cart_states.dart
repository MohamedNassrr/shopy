import 'package:online_shop_app/features/Cart/data/models/cart_model.dart';

abstract class CartStates {}

class CartInitialStates extends CartStates {}

class CartLoadingStates extends CartStates {}


class CartUpdatedStates extends CartStates {
  final List<CartModel> cartItem;

  CartUpdatedStates(this.cartItem);
}

class CartRemovedStates extends CartStates {
  final List<CartModel> cartItem;

  CartRemovedStates(this.cartItem);
}

class CartFailureStates extends CartStates {
  final String failure;

  CartFailureStates(this.failure);
}
