import 'package:flutter/material.dart';

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
            style: const TextTheme().bodySmall!.copyWith(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}