import 'package:flutter/material.dart';
import 'package:online_shop_app/core/styles/texts_styles.dart';
import 'package:online_shop_app/features/Cart/presentation/views/widgets/cart_list_view.dart';
import 'package:online_shop_app/features/Cart/presentation/views/widgets/order_summery.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Cart',
            style: TextsStyles.textStyle16,
          ),
        ),
        SizedBox(height: 10),
        CartListView(),
        SizedBox(height: 2),
        OrderSummery(),
      ],
    );
  }
}
