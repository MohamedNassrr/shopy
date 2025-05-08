import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop_app/core/widgets/failure_snack_bar.dart';
import 'package:online_shop_app/features/Cart/presentation/controller/cart_cubit/cart_cubit.dart';
import 'package:online_shop_app/features/Cart/presentation/controller/cart_cubit/cart_states.dart';
import 'package:online_shop_app/features/Cart/presentation/views/widgets/cart_empty_screen.dart';
import 'package:online_shop_app/features/Cart/presentation/views/widgets/cart_list_item.dart';
import 'package:online_shop_app/features/home/presentation/views/widgets/custom_circle_indicator.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartStates>(
      listener: (context, state) {
        if (state is CartFailureStates) {
          SnackBar snackBar = SnackBar(
              content: FailureSnackBar(
            errMessage: state.failure,
          ));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          log(state.failure.toString());
        }
      },
      builder: (context, state) {

        if (state is CartUpdatedStates) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.separated(

                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final item = state.cartItem[index];
                  return CartListItem(
                    products: item.productModel,
                    quantity: item.quantity,
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: state.cartItem.length,
              ),
            ),
          );
        } else if (state is CartLoadingStates) {
          return const Expanded(
              child: Center(
            child: CustomCircleIndicator(),
          ));
        } else {
          return const CartEmptyScreen();
        }
      },
    );
  }
}
