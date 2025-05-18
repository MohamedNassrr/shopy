import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_shop_app/features/home/data/models/product_model/product_model.dart';
import 'package:online_shop_app/features/home/presentation/views/widgets/product_buttons.dart';
import 'package:online_shop_app/features/home/presentation/views/widgets/product_detail_body.dart';

class ProductDetailViewBody extends StatelessWidget {
  const ProductDetailViewBody({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 350,
          child: Image(
            image: NetworkImage(product.thumbnail),
          ),
        ),
        const Spacer(),
        ProductDetailBody(
          product: product,
        ),
        const Spacer(),
        ProductButtons(product: product),
      ],
    );
  }
}
