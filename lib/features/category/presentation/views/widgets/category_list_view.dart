import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop_app/core/widgets/custom_error_message.dart';
import 'package:online_shop_app/features/category/presentation/controller/category_cubit/category_cubit.dart';
import 'package:online_shop_app/features/category/presentation/controller/category_cubit/category_states.dart';
import 'package:online_shop_app/features/home/presentation/views/widgets/category_list_item.dart';
import 'package:online_shop_app/features/home/presentation/views/widgets/custom_circle_indicator.dart';
import 'package:online_shop_app/generated/l10n.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).category,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            height: 13,
          ),
          SizedBox(
            height: 83,
            child: BlocBuilder<CategoryCubit, CategoryStates>(
              builder: (context, state) {
                if (state is CategorySuccessStates) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final categories = state.categories[index];
                      final dynamic categoryCubit = context.read<CategoryCubit>().imageIcon[index];
                      return CategoryListItem(categories: categories, categoryCubit: categoryCubit);
                    },
                  );
                } else if (state is CategoryFailureStates) {
                  return CustomErrorWidget(errorMessage: state.failure);
                } else {
                  return const Center(
                    child: CustomCircleIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

