import 'package:dartz/dartz.dart';
import 'package:online_shop_app/core/errors/apis_failures.dart';
import 'package:online_shop_app/features/Cart/data/models/payment_intent_input_model.dart';

abstract class StripeRepo {
  Future<Either<ApisFailure, void>> fetchPayment(
      {required PaymentIntentInputModel paymentIntentInputModel});
}
