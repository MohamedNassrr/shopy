import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop_app/features/Cart/presentation/controller/cart_cubit/cart_cubit.dart';
import 'package:online_shop_app/features/Cart/presentation/views/widgets/cart_view_body.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  void initState() {
    context.read<CartCubit>().fetchCartItem();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CartViewBody(),
      ),
    );
  }
}
