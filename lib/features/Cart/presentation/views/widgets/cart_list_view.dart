import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop_app/core/widgets/custom_error_message.dart';
import 'package:online_shop_app/features/Cart/presentation/controller/cart_cubit/cart_cubit.dart';
import 'package:online_shop_app/features/Cart/presentation/controller/cart_cubit/cart_states.dart';
import 'package:online_shop_app/features/Cart/presentation/views/widgets/cart_list_item.dart';
import 'package:online_shop_app/features/home/presentation/views/widgets/custom_circle_indicator.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<CartCubit,CartStates>(
      builder: (context, state) {
        if(state is CartSuccessStates){
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) =>  CartListItem(
                  cartModel: state.cart[index],
                ),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: state.cart.length,
              ),
            ),
          );
        }else if(state is CartFailureStates){
          return CustomErrorWidget(errorMessage: state.failure);
        }else{
          return const Center(child: CustomCircleIndicator());
        }
      },
    );
  }
}
