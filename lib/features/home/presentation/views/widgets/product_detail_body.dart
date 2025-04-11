import 'package:flutter/material.dart';
import 'package:online_shop_app/core/styles/texts_styles.dart';
import 'package:online_shop_app/features/home/data/models/product_model/product_model.dart';

class ProductDetailBody extends StatelessWidget {
  const ProductDetailBody({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${product.brand}',
            style:
                TextsStyles.textStyle25.copyWith(fontWeight: FontWeight.w800),
          ),
          Text(
            '${product.title}',
            style: TextsStyles.textStyle16,
          ),
          const SizedBox(height: 6),
          Text(
            '\$ ${product.price}',
            style: TextsStyles.textStyle18,
          ),
          const SizedBox(height: 11),
          const Text(
            'Description',
            style: TextsStyles.textStyle18,
          ),
          Text(
            '${product.description}',
            style: TextsStyles.textStyle12.copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
