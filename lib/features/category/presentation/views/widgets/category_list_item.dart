import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop_app/features/category/data/models/category_model/category_model.dart';
import 'package:online_shop_app/features/category/presentation/controller/category_cubit/category_cubit.dart';

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({
    super.key, required this.categoryModel,
  });

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    var categoryCubit = context.read<CategoryCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          debugPrint('item pressed');
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .055,
              width: MediaQuery.of(context).size.width * .13,
              decoration: BoxDecoration(
                  color: const Color(0xffEDF7FF),
                  borderRadius: BorderRadius.circular(8)),
              child: Image.asset(
                categoryCubit.imageIcon[0],
                fit: BoxFit.contain,
              ),
            ),
            Text(
                categoryModel.name,
                style: Theme.of(context).textTheme.labelMedium
            ),
          ],
        ),
      ),
    );
  }
}
