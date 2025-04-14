import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_shop_app/core/styles/texts_styles.dart';
import 'package:online_shop_app/core/utils/app_router.dart';

class CartAppBar extends StatelessWidget {
  const CartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'cart',
          style: TextsStyles.textStyle16,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 5,
          children: [
            const Icon(
              Icons.location_on_rounded,
              color: Colors.grey,
              size: 15,
            ),
            const Text(
              'Delivery address',
              style: TextsStyles.textStyle11,
            ),
            InkWell(
              onTap: () {
                GoRouter.of(context).push(AppRouter.kGoogleMapsView);
              },
              child: const Row(
                children: [
                  Text(
                    'Nasr city, Cairo Egypt',
                    style: TextsStyles.textStyle12,
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_outlined,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
