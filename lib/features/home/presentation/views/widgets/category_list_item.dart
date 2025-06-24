import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_shop_app/core/utils/app_router.dart';
import 'package:online_shop_app/features/category/data/models/category_model/category_model.dart';

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({
    super.key,
    required this.categories,
    required this.categoryCubit,
  });

  final CategoryModel categories;
  final dynamic categoryCubit;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3/ 2.9,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7,),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {
            GoRouter.of(context).push(
              AppRouter.rProductCategory,
              extra: categories,
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height:
                  MediaQuery.of(context).size.height *
                      .055,
                  width: MediaQuery.of(context).size.width *
                      .15,
                  decoration: BoxDecoration(
                      color: const Color(0xffEDF7FF),
                      borderRadius:
                      BorderRadius.circular(8)),
                  child: Image(
                      image: AssetImage(categoryCubit))),
              Text(
                categories.name!,
                style:
                Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
