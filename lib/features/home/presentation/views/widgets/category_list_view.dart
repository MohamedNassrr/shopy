import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          return  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Category',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 13,
                ),
                const SizedBox(
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
