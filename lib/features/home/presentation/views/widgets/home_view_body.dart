import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_shop_app/core/utils/app_router.dart';
import 'package:online_shop_app/core/widgets/failure_snack_bar.dart';
import 'package:online_shop_app/features/category/presentation/views/category_view.dart';
import 'package:online_shop_app/features/home/presentation/controller/product_cubit/product_cubit.dart';
import 'package:online_shop_app/features/home/presentation/controller/product_cubit/product_states.dart';
import 'package:online_shop_app/features/home/presentation/views/widgets/custom_circle_indicator.dart';
import 'package:online_shop_app/features/home/presentation/views/widgets/custom_gird_item.dart';
import 'package:online_shop_app/features/home/presentation/views/widgets/my_carousal_slider.dart';

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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GestureDetector(
                      onTap: (){
                        GoRouter.of(context).push(AppRouter.rSearchView);
                      },
                      child: Container(
                        width: double.infinity,
                        height: 47,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.grey
                          )
                        ),
                        child:  Row(
                          spacing: 5,
                          children: [
                            const Icon(Icons.search),
                            Text(
                                'search here...',
                              style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 14),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const MyCarousalSlider(),
                  const CategoryView(),
                  const SizedBox(height: 8.5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Recent product',
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
                  return Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(
                          AppRouter.rProductDetailsView,
                          extra: state.product[index],
                        );
                      },
                      child: CustomGridItem(
                        productModel: state.product[index],
                      ),
                    ),
                  );
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
