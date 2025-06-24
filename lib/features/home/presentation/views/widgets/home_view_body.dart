import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop_app/core/widgets/failure_snack_bar.dart';
import 'package:online_shop_app/features/category/presentation/views/category_view.dart';
import 'package:online_shop_app/features/home/presentation/controller/product_cubit/product_cubit.dart';
import 'package:online_shop_app/features/home/presentation/controller/product_cubit/product_states.dart';
import 'package:online_shop_app/features/home/presentation/views/widgets/custom_circle_indicator.dart';
import 'package:online_shop_app/features/home/presentation/views/widgets/my_carousal_slider.dart';
import 'package:online_shop_app/features/home/presentation/views/widgets/search_custom_container.dart';
import 'package:online_shop_app/features/home/presentation/views/widgets/sliver_grid_list_item.dart';
import 'package:online_shop_app/generated/l10n.dart';
import 'custom_sliver_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductStates>(
      listener: (context, state) {
        if (state is ProductFailureStates) {
          SnackBar snackBar =
              SnackBar(content: FailureSnackBar(errMessage: state.errMessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          log(state.errMessage.toString());
        }
      },
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            const CustomSliverAppBar(),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SearchCustomContainer(),
                  const MyCarousalSlider(),
                  const CategoryView(),
                  const SizedBox(height: 8.5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      S.of(context).recentProduct,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                if (state is ProductSuccessStates) {
                  final productModel = state.product[index];
                  return SliverGirdListItem(productModel:  productModel,);
                } else {
                  return const Center(child: CustomCircleIndicator());
                }
              },
            ),
          ],
        );
      },
    );
  }
}

