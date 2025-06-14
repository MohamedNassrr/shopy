import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop_app/features/Cart/presentation/controller/cart_cubit/cart_cubit.dart';
import 'package:online_shop_app/generated/l10n.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key});

  @override
  Widget build(BuildContext context) {
    var summeryCubit = context.watch<CartCubit>();
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Text(
          S.of(context).totalPrice,
        ),
        Text(
          '\$ ${summeryCubit.totalPrice().toStringAsFixed(1)}',
        ),
      ],
    );
  }
}
