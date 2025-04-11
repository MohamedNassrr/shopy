import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_shop_app/core/styles/texts_styles.dart';
import 'package:online_shop_app/core/utils/app_router.dart';
import 'package:online_shop_app/core/utils/assets_data.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      leading: Image.asset(
        AssetsData.logoIcon,
      ),
      titleSpacing: 5,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.location_on_rounded,
                color: Colors.grey,
                size: 15,
              ),
              Text(
                'Delivery address',
                style: TextsStyles.textStyle11,
              ),
            ],
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
      actions: [
        Stack(
          children: [
            const Positioned(
              right: 9,
              top: 7.8,
              child: CircleAvatar(
                backgroundColor: Colors.red,
                radius: 7,
                child: Text(
                  '10',
                  style: TextStyle(color: Colors.white, fontSize: 9),
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_none_rounded,
                color: Colors.black,
                size: 23,
              ),
            ),
          ],
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          color: Colors.white,
        ),
      ),
    );
  }
}
