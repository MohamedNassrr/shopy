import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_shop_app/core/styles/texts_styles.dart';
import 'package:online_shop_app/core/utils/app_router.dart';
import 'package:online_shop_app/core/utils/assets_data.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
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
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 15,
            children: <Widget>[
              Container(
                width: 122,
                height: 122,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Image(
                  image: AssetImage(
                    AssetsData.testImage,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 6,
                children: [
                  const Text(
                    'Monitor LG 22 inc 4k 120 fps',
                    style: TextsStyles.textStyle14,
                  ),
                  Text(
                    'LG',
                    style: TextsStyles.textStyle12.copyWith(color: Colors.grey),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '\$ 1900',
                        style: TextsStyles.textStyle14,
                      ),
                     ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {super.key,
      required this.onPressed,

      required this.icon});

  final Function() onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
      ),
    );
  }
}
