import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_shop_app/core/services/service_locator.dart';
import 'package:online_shop_app/core/utils/app_router.dart';
import 'package:online_shop_app/core/widgets/custom_error_message.dart';
import 'package:online_shop_app/features/category/data/repos/cat_repo_impl.dart';
import 'package:online_shop_app/features/category/presentation/controller/category_cubit/category_cubit.dart';
import 'package:online_shop_app/features/category/presentation/controller/category_cubit/category_states.dart';
import 'package:online_shop_app/features/home/presentation/views/widgets/custom_circle_indicator.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CategoryCubit(getIt.get<CatRepoImpl>())..fetchCategories(),
      child: Padding(
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
            SizedBox(
              height: 78,
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
                        return AspectRatio(
                          aspectRatio: 3.25 / 2.8,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 7),
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
                                          .14,
                                      decoration: BoxDecoration(
                                          color: const Color(0xffEDF7FF),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Image(
                                          image: AssetImage(context
                                              .read<CategoryCubit>()
                                              .imageIcon[index]))),
                                  Text(
                                    state.categories[index].name!,
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
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
      ),
    );
  }
}
