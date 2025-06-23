import 'package:flutter/material.dart';
import 'package:online_shop_app/features/Cart/presentation/views/widgets/cart_list_view.dart';
import 'package:online_shop_app/features/Cart/presentation/views/widgets/order_summery.dart';
import 'package:online_shop_app/generated/l10n.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              S.of(context).cart,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(height: 10),
          const CartListView(),
          const SizedBox(height: 2),
          const OrderSummery(),
        ],
      ),
    );
  }
}
