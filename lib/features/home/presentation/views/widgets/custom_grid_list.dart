import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop_app/core/styles/texts_styles.dart';
import 'package:online_shop_app/features/home/presentation/controller/product_cubit/product_cubit.dart';
import 'package:online_shop_app/features/home/presentation/controller/product_cubit/product_states.dart';
import 'package:online_shop_app/features/home/presentation/views/widgets/custom_gird_item.dart';

class CustomGridList extends StatelessWidget {
  const CustomGridList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit,ProductStates>(
      builder:(context, state) {
        if(state is ProductSuccessStates){
          return Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  ' Recent product',
                  style: TextsStyles.textStyle14,
                ),
                const SizedBox(height: 8),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  childAspectRatio: 6 / 6.32,
                  physics: const NeverScrollableScrollPhysics(),
                  children: List.generate(
                    state.product.length,
                        (index) => Padding(
                      padding: const EdgeInsets.only(
                        right: 20,
                        top: 5,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          debugPrint('itemPressed');
                        },
                        child: CustomGridItem(productModel: state.product[index],),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }else if(state is ProductFailureStates){
          return Text('there is error${state.errMessage.toString()}');
        }else{
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
