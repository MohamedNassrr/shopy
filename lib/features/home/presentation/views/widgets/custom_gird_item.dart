import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_shop_app/features/Cart/presentation/controller/cart_cubit/cart_cubit.dart';
import 'package:online_shop_app/features/home/data/models/product_model/product_model.dart';
import 'package:provider/provider.dart';

class CustomGridItem extends StatelessWidget {
  const CustomGridItem({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.76,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 3 / 2.3,
              child: Container(
                //w 170,h112
                width: MediaQuery.of(context).size.width * 0.53,
                height: MediaQuery.of(context).size.height * 0.13,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                      productModel.images![0],
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 13,
            ),
            Text(
              '${productModel.title}',
              style: Theme.of(context).textTheme.labelMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.51,
              child: Row(
                children: [
                  Text(
                    '\$${productModel.price}',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      context.read<CartCubit>().addToCart(productModel);
                    },
                    icon: const Icon(
                      FontAwesomeIcons.cartPlus,
                      size: 15,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
