import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop_app/core/styles/texts_styles.dart';
import 'package:online_shop_app/features/home/presentation/controller/category_cubit/category_cubit.dart';
import 'package:online_shop_app/features/home/presentation/controller/category_cubit/category_states.dart';
import 'package:online_shop_app/features/home/presentation/views/widgets/category_list_item.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit(),
      child: BlocBuilder<CategoryCubit, CategoryStates>(
        builder: (context, state) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
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
                  height: 78,
                  child: CategoryListItem(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
