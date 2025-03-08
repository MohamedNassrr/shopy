import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_shop_app/core/styles/texts_styles.dart';
import 'package:online_shop_app/core/utils/assets_data.dart';

class CustomGridItem extends StatelessWidget {
  const CustomGridItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.76,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            //w 170,h112
            width: MediaQuery.of(context).size.width * 0.53,
            height: MediaQuery.of(context).size.height * 0.13,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              image: DecorationImage(
                image: AssetImage(
                  AssetsData.testImage,
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            height: 13,
          ),
          Text(
            'Monitor LG 22”inc 4K 120Fps',
            style: TextsStyles.textStyle12,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.51,
            child: Row(
              children: [
                Text(
                  '\$199.9',
                  style: TextsStyles.textStyle14.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    print('button work');
                  },
                  icon: Icon(
                    FontAwesomeIcons.cartPlus,
                    size: 15,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
