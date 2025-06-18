import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:online_shop_app/core/errors/apis_failures.dart';
import 'package:online_shop_app/core/services/stripe_service.dart';
import 'package:online_shop_app/features/Cart/data/models/payment_intent_input_model.dart';
import 'package:online_shop_app/features/Cart/data/repos/stripe_repo.dart';

class StripeRepoImpl implements StripeRepo {
  final StripeService stripeService = StripeService();

  @override
  Future<Either<ApisFailure, void>> fetchPayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailures.fromDioError(e));
      }
      return left(ServerFailures(e.toString()));
    }
  }
}
