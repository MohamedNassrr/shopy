import 'package:flutter/material.dart';
import 'package:online_shop_app/core/styles/texts_styles.dart';
import 'package:online_shop_app/features/home/presentation/views/widgets/custom_gird_item.dart';

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
            ' Recent product',
            style: TextsStyles.textStyle14,
          ),
          SizedBox(height: 8),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            childAspectRatio: 6 / 6.32,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(
              16,
              (index) => Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                  top: 5,
                ),
                child: GestureDetector(
                  onTap: () {
                    debugPrint('itemPressed');
                  },
                  child: CustomGridItem(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
