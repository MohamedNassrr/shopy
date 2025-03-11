import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_shop_app/core/styles/texts_styles.dart';
import 'package:online_shop_app/features/home/presentation/views/widgets/custom_text_field.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  print('user pressed');
                },
                icon: Icon(
                  FontAwesomeIcons.circleUser,
                  size: 23,
                  color: Colors.black,
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Delivery address',
                    style: TextsStyles.textStyle11,
                  ),
                  InkWell(
                      onTap: () {},
                      child: Row(
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
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                  size: 23,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications_none_rounded,
                  color: Colors.black,
                  size: 23,
                ),
              ),
            ],
          ),
          CustomTextField(),
          SizedBox(height: 7),
        ],
      ),
    );
  }
}
