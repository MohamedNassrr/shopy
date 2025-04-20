abstract class CartStates {}

class CartInitialStates extends CartStates {}

class CartLoadingStates extends CartStates {}

class CartSuccessStates extends CartStates {}

class CartCounterAddStates extends CartStates {}

class CartCounterMinusStates extends CartStates {}

class CartFailureStates extends CartStates {
  final String failure;

  CartFailureStates(this.failure);
}
