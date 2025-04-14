import 'package:flutter/material.dart';
import 'package:online_shop_app/features/Cart/presentation/views/widgets/cart_app_bar.dart';
import 'package:online_shop_app/features/Cart/presentation/views/widgets/cart_list_view.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          CartAppBar(),
          CartListView(),
        ],
      ),
    );
  }
}
