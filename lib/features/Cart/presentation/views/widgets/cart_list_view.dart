import 'package:flutter/material.dart';
import 'package:online_shop_app/features/Cart/presentation/views/widgets/cart_list_item.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: ListView.separated(
        shrinkWrap: false,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => const CartListItem(),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: 12,
      ),
    );
  }
}
