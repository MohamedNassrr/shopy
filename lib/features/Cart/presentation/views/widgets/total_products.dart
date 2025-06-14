import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop_app/features/Cart/presentation/controller/cart_cubit/cart_cubit.dart';
import 'package:online_shop_app/generated/l10n.dart';

class TotalProducts extends StatelessWidget {
  const TotalProducts({super.key});

  @override
  Widget build(BuildContext context) {
    var summeryCubit = context.watch<CartCubit>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Text(
          S.of(context).cartProducts,
        ),
        Text(
          '${summeryCubit.totalProduct()}',
        ),
      ],
    );
  }
}
