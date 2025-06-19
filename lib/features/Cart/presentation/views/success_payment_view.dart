import 'package:flutter/material.dart';
import 'package:online_shop_app/features/Cart/presentation/views/widgets/success_payment_view_body.dart';

class SuccessPaymentView extends StatelessWidget {
  const SuccessPaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: SuccessPaymentViewBody()),
    );
  }
}
