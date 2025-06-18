abstract class PaymentStates {}

class PaymentInitialStates extends PaymentStates {}

class PaymentLoadingStates extends PaymentStates {}

class PaymentSuccessStates extends PaymentStates {}

class PaymentFailureStates extends PaymentStates {
  final String failure;

  PaymentFailureStates(this.failure);
}