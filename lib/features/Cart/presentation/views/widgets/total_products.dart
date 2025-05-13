import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop_app/features/Cart/presentation/controller/cart_cubit/cart_cubit.dart';

class TotalProducts extends StatelessWidget {
  const TotalProducts({super.key});

  @override
  Widget build(BuildContext context) {
    var summeryCubit = context.watch<CartCubit>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Products',
        ),
        Text(
          '${summeryCubit.totalProduct()}',
        ),
      ],
    );
  }
}
