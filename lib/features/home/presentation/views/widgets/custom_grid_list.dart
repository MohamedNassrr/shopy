import 'package:flutter/material.dart';
import 'package:online_shop_app/core/styles/texts_styles.dart';
import 'package:online_shop_app/core/utils/assets_data.dart';
import 'package:online_shop_app/core/widgets/custom_text_button.dart';

class CustomGridList extends StatelessWidget {
  const CustomGridList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent product',
            style: TextsStyles.textStyle14,
          ),
          SizedBox(height: 13),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            childAspectRatio: 5.47 / 6.32,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(
              16,
              (index) => Padding(
                padding: const EdgeInsets.only(right: 20),
                child: GestureDetector(
                  onTap: () {
                    debugPrint('itemPressed');
                  },
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
                      Text(
                        '\$199.9',
                        style: TextsStyles.textStyle14.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 11),
                      Align(
                        alignment: AlignmentDirectional.center,
                        child: CustomTextButton(
                          width: 144,
                          height: 31,
                          onPressed: () {},
                          text: 'Add to cart',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
