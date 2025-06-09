import 'package:flutter/material.dart';
import 'package:online_shop_app/core/widgets/custom_text_button.dart';
import 'package:online_shop_app/features/Cart/presentation/views/widgets/payments_bottom_sheet.dart';
import 'package:online_shop_app/features/Cart/presentation/views/widgets/total_price.dart';
import 'package:online_shop_app/features/Cart/presentation/views/widgets/total_products.dart';

class OrderSummery extends StatelessWidget {
  const OrderSummery({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          const Divider(),
          Text(
            'Order Summery',
            style:
             Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w700),
          ),
          const TotalPrice(),
          const TotalProducts(),
          CustomTextButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => const PaymentBottomSheet(),
              );
            },
            text: 'Continue for payments',
          ),
        ],
      ),
    );
  }
}
