import 'package:flutter/material.dart';
import 'package:online_shop_app/features/Cart/presentation/controller/cart_cubit/cart_cubit.dart';
import 'package:provider/provider.dart';

class TotalProducts extends StatelessWidget {
  const TotalProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Products',
        ),
        Text(
          '${context.read<CartCubit>().totalProduct()}',
        ),
      ],
    );
  }
}
