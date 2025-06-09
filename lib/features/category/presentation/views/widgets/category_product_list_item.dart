import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:online_shop_app/core/utils/app_router.dart';
import 'package:online_shop_app/features/Cart/presentation/controller/cart_cubit/cart_cubit.dart';
import 'package:online_shop_app/features/home/data/models/product_model/product_model.dart';

class CategoryProductListItem extends StatelessWidget {
  const CategoryProductListItem({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        GoRouter.of(context).push(
          AppRouter.rProductDetailsView,
          extra: product,
        );
      },
      child: ListTile(
        leading: Image.network(
          product.thumbnail,
        ),
        title: Text(
          product.title ?? 'no title',
        ),
        subtitle: Text('${product.price ?? '0'}\$'),
        trailing:  IconButton(
          onPressed: () {
            context.read<CartCubit>().addToCart(product);
          },
          icon: const Icon(
            FontAwesomeIcons.cartPlus,
            size: 15,
          ),
        ),
      ),
    );
  }
}