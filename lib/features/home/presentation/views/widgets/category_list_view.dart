import 'package:flutter/material.dart';
import 'package:online_shop_app/core/styles/texts_styles.dart';
import 'package:online_shop_app/core/utils/assets_data.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Category',
            style: TextsStyles.textStyle14,
          ),
          SizedBox(
            height: 13,
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              shrinkWrap: true,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * .055,
                      width: MediaQuery.of(context).size.width * .13,
                      decoration: BoxDecoration(
                          color: Color(0xffEDF7FF),
                          borderRadius: BorderRadius.circular(8)),
                      child: Image.asset(
                        AssetsData.clothesIcon,
                      ),
                    ),
                    Text(
                      'Clothes',
                      style: TextsStyles.textStyle12.copyWith(
                        color: Color(0xff939393),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
