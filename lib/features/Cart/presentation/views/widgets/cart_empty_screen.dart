import 'package:flutter/material.dart';
import 'package:online_shop_app/core/styles/texts_styles.dart';

class CartEmptyScreen extends StatelessWidget {
  const CartEmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'cart is empty',
            style: TextsStyles.textStyle14.copyWith(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}