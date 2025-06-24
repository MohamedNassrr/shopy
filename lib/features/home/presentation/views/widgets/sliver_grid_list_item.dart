import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_shop_app/core/utils/app_router.dart';
import 'package:online_shop_app/features/home/data/models/product_model/product_model.dart';
import 'package:online_shop_app/features/home/presentation/views/widgets/custom_gird_item.dart';

class SliverGirdListItem extends StatelessWidget {
  const SliverGirdListItem({
    super.key, required this.productModel,
  });
  final ProductModel productModel ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).push(
            AppRouter.rProductDetailsView,
            extra: productModel,
          );
        },
        child: CustomGridItem(
          productModel: productModel,
        ),
      ),
    );
  }
}

