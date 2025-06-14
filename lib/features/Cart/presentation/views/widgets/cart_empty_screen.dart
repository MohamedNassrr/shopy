import 'package:flutter/material.dart';
import 'package:online_shop_app/generated/l10n.dart';

class CartEmptyScreen extends StatelessWidget {
  const CartEmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            S.of(context).cartEmpty,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}