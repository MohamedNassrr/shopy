import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_shop_app/core/widgets/custom_icon_button.dart';
import 'package:online_shop_app/features/Cart/presentation/controller/cart_cubit/cart_cubit.dart';
import 'package:online_shop_app/features/Cart/presentation/controller/cart_cubit/cart_states.dart';
import 'package:online_shop_app/features/home/data/models/product_model/product_model.dart';

class CartListItem extends StatelessWidget {
  const CartListItem({super.key, required this.products, required this.quantity});
  final ProductModel products;
  final int quantity;


  @override
  Widget build(BuildContext context) {

    return BlocBuilder<CartCubit, CartStates>(
      builder: (context, state) {
        var cartCubit = BlocProvider.of<CartCubit>(context);
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 15,
          children: [
            Container(
              width: 122,
              height: 122,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child:  Image(
                image: NetworkImage(
                  products.thumbnail,
                ),

              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 6,
                children: [
                   Text(
                    '${products.title}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),

                  const SizedBox(height: 2),
                  Row(
                    spacing: 7,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       Text(
                         '\$ ${products.price ?? '0'}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const Spacer(),
                      CustomIconButton(
                        onTap: () {
                          cartCubit.decCartItem(products);
                        },
                        borderColor: Colors.grey.shade200,
                        icon: Icons.remove,
                      ),
                      Text(
                        '$quantity',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      CustomIconButton(
                        borderColor: Colors.grey.shade200,
                        onTap: () {
                          cartCubit.incCartItem(products);
                        },
                        icon: Icons.add,
                      ),
                      CustomIconButton(
                        onTap: () {
                          cartCubit.removeItem(products);
                        },
                        icon: FontAwesomeIcons.trash,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
