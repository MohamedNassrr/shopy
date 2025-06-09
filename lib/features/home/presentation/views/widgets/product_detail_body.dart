import 'package:flutter/material.dart';
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
            style: const TextTheme()
                .titleMedium!
                .copyWith(fontWeight: FontWeight.w800),
          ),
          Text(
            '${product.title}',
            style: const TextTheme().bodyMedium,
          ),
          const SizedBox(height: 6),
          Text(
            '\$${product.price}',
            style: const TextTheme().bodyLarge,
          ),
          const SizedBox(height: 11),
          Text(
            'Description',
            style: const TextTheme().bodyLarge,
          ),
          Text(
            '${product.description}',
            style: const TextTheme().labelMedium!.copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
