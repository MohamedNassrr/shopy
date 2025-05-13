import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_shop_app/core/widgets/custom_text_button.dart';
import 'package:online_shop_app/features/Cart/presentation/controller/cart_cubit/cart_cubit.dart';
import 'package:online_shop_app/features/home/data/models/product_model/product_model.dart';
import 'package:online_shop_app/features/home/presentation/views/widgets/product_detail_body.dart';
import 'package:provider/provider.dart';

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
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 35,
          ),
          child: Row(
            children: [
              Expanded(
                child: CustomTextButton(
                  onPressed: () {
                    context.read<CartCubit>().addToCart(product);
                  },
                  text: 'Add to Cart',
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: CustomTextButton(
                  colors: Colors.grey.shade300,
                  onPressed: () {
                    // navigate to payment screen
                  },
                  text: 'Buy Now',
                  textColor: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
