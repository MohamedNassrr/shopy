import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_shop_app/core/styles/texts_styles.dart';
import 'package:online_shop_app/core/utils/assets_data.dart';
import 'package:online_shop_app/core/widgets/custom_icon_button.dart';

class CartListItem extends StatelessWidget {
  const CartListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
        Expanded(
          child: Column(
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
                spacing: 7,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    '\$ 1900',
                    style: TextsStyles.textStyle14,
                  ),
                  const Spacer(),
                  CustomIconButton(
                    onTap: () {},
                    color: Colors.grey.shade200,
                    icon: Icons.remove,
                  ),
                  const Text(
                    '1',
                    style: TextsStyles.textStyle14,
                  ),
                  CustomIconButton(
                    color: Colors.grey.shade200,
                    onTap: () {},
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
  }
}
