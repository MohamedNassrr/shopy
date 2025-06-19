import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:online_shop_app/core/utils/app_router.dart';
import 'package:online_shop_app/core/widgets/custom_button.dart';
import 'package:online_shop_app/features/Cart/data/models/payment_intent_input_model.dart';
import 'package:online_shop_app/features/Cart/presentation/controller/cart_cubit/cart_cubit.dart';
import 'package:online_shop_app/features/Cart/presentation/controller/payment_cubit/payment_cubit.dart';
import 'package:online_shop_app/features/Cart/presentation/controller/payment_cubit/payment_states.dart';
import 'package:online_shop_app/generated/l10n.dart';

class CreditCardBottomSheet extends StatelessWidget {
  const CreditCardBottomSheet({
    super.key,
    required this.lang,
  });

  final S lang;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentStates>(
      listener: (context, state) {
        if(state is PaymentSuccessStates){

          GoRouter.of(context).push(AppRouter.rSuccessPayment);
        }
        if (state is PaymentFailureStates) {
          GoRouter.of(context).pop();
          SnackBar snackBar = SnackBar(content: Text(state.failure));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        var paymentCubit = context.read<PaymentCubit>();
        var cartCubit = context.watch<CartCubit>();
        return Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          child: CustomButton(
            isLoading: state is PaymentLoadingStates ? true : false,
            onTap: () {
              PaymentIntentInputModel paymentIntentInputModel =
                  PaymentIntentInputModel(amount: cartCubit.totalPrice().toInt(), currency: 'USD');
              paymentCubit.fetchPayment(
                  paymentIntentInputModel: paymentIntentInputModel);
            },
            icon: FontAwesomeIcons.ccVisa,
            iconSize: 25,
            text: lang.creditCard,
            iconColor: Colors.blue,
            width: double.infinity,
            height: 45,
          ),
        );
      },
    );
  }
}
