import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_shop_app/core/styles/texts_styles.dart';
import 'package:online_shop_app/core/widgets/custom_icon_button.dart';
import 'package:online_shop_app/features/Cart/data/models/carts_model/product.dart';
import 'package:online_shop_app/features/Cart/presentation/controller/cart_cubit/cart_cubit.dart';
import 'package:online_shop_app/features/Cart/presentation/controller/cart_cubit/cart_states.dart';

class CartListItem extends StatelessWidget {
  const CartListItem({super.key, required this.products});
  final Product products;

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
                  products.thumbnail ?? 'no image',
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
                    style: TextsStyles.textStyle14,
                  ),

                  const SizedBox(height: 2),
                  Row(
                    spacing: 7,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       Text(
                         '\$ ${products.price ?? 'no'}',
                        style: TextsStyles.textStyle14,
                      ),
                      const Spacer(),
                      CustomIconButton(
                        onTap: () {
                          cartCubit.counterMinus();
                        },
                        color: Colors.grey.shade200,
                        icon: Icons.remove,
                      ),
                      Text(
                        '${products.quantity}',
                        style: TextsStyles.textStyle14,
                      ),
                      CustomIconButton(
                        color: Colors.grey.shade200,
                        onTap: () {
                          cartCubit.counterAdd();
                        },
                        icon: Icons.add,
                      ),
                      CustomIconButton(
                        onTap: () {},
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
