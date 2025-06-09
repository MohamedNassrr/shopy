import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop_app/core/widgets/custom_error_message.dart';
import 'package:online_shop_app/features/category/presentation/controller/cat_product_cubit/cat_product_cubit.dart';
import 'package:online_shop_app/features/category/presentation/controller/cat_product_cubit/cat_product_states.dart';
import 'package:online_shop_app/features/home/presentation/views/widgets/custom_circle_indicator.dart';

class CategoryProductBody extends StatelessWidget {
  const CategoryProductBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatProductCubit, CatProductStates>(
      builder: (context, state) {
        if (state is CatProductSuccessState) {
          return ListView.separated(
            itemBuilder: (context, index) {
              final product = state.product[index];
              return ListTile(
                leading: Image.network(
                  product.thumbnail,
                ),
                title: Text(
                  product.title ?? 'no title',
                ),
                subtitle: Text('${product.price ?? '0'}\$'),
              );
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: state.product.length,
          );
        } else if (state is CatProductFailureState) {
          return CustomErrorWidget(errorMessage: state.errMessage);
        } else {
          return const Center(
            child: CustomCircleIndicator(),
          );
        }
      },
    );
  }
}
