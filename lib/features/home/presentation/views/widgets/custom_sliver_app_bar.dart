import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_shop_app/core/styles/texts_styles.dart';
import 'package:online_shop_app/core/utils/app_router.dart';
import 'package:online_shop_app/core/utils/assets_data.dart';

class CustomSliverAppBar extends StatefulWidget {
  const CustomSliverAppBar({super.key});

  @override
  State<CustomSliverAppBar> createState() => _CustomSliverAppBarState();
}

class _CustomSliverAppBarState extends State<CustomSliverAppBar> {
  String? selectedLocation;

  @override
  Widget build(BuildContext context) {

    return SliverAppBar(
      pinned: true,
      leading: Image.asset(
        AssetsData.shopyIcon,
      ),
      titleSpacing: 5,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
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
              onTap: () async {
                final result =
                    await GoRouter.of(context).push<Map<String,dynamic>>(AppRouter.kGoogleMapsView);
                if (result != null && result['placeName'] != null) {
                  setState(() {
                    selectedLocation = result['placeName'];
                  });
                  log(selectedLocation.toString());
                }
                },
              child:  Row(
                children: [
                  Expanded(
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,

                      selectedLocation ?? 'select your delivery address',
                      style: TextsStyles.textStyle12,
                    ),
                  ),
                  const Icon(
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
