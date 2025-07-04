import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:online_shop_app/features/Cart/data/models/payment_intent_input_model.dart';
import 'package:online_shop_app/features/Cart/data/repos/stripe_repo.dart';
import 'package:online_shop_app/features/Cart/presentation/controller/payment_cubit/payment_states.dart';

class PaymentCubit extends Cubit<PaymentStates> {
  PaymentCubit(this.stripeRepo) : super(PaymentInitialStates());

  final StripeRepo stripeRepo;

  Future fetchPayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(PaymentLoadingStates());
    var result = await stripeRepo.fetchPayment(
        paymentIntentInputModel: paymentIntentInputModel);
    result.fold((failure) {
      emit(PaymentFailureStates(failure.errMessage));
      log(failure.errMessage.toString());
    }, (success) {
      emit(PaymentSuccessStates());
    });
  }
}
