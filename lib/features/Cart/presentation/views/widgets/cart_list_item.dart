import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_shop_app/core/styles/texts_styles.dart';
import 'package:online_shop_app/core/widgets/custom_icon_button.dart';
import 'package:online_shop_app/features/Cart/data/models/cart_model/cart_model.dart';
import 'package:online_shop_app/features/Cart/presentation/controller/cart_cubit/cart_cubit.dart';
import 'package:online_shop_app/features/Cart/presentation/controller/cart_cubit/cart_states.dart';

class CartListItem extends StatelessWidget {
  const CartListItem({super.key, required this.cartModel});
  final CartModel cartModel;

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
                  cartModel.products![0].thumbnail ?? 'no image',
                ),

              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 6,
                children: [
                   Text(
                    cartModel.products![0].title,
                    style: TextsStyles.textStyle14,
                  ),

                  const SizedBox(height: 2),
                  Row(
                    spacing: 7,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       Text(
                         '\$ ${cartModel.products![0].price ?? '0'}',
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
                        '${cartModel.products![0].quantity}',
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
