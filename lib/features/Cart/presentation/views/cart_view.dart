import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop_app/core/services/service_locator.dart';
import 'package:online_shop_app/features/Cart/data/repos/cart_repo_impl.dart';
import 'package:online_shop_app/features/Cart/presentation/controller/cart_cubit/cart_cubit.dart';
import 'package:online_shop_app/features/Cart/presentation/views/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CartCubit(getIt.get<CartRepoImpl>())..fetchCartItem(),
      child:  const Scaffold(
        body: SafeArea(
          child: CartViewBody(),
        ),
      ),
    );
  }
}
