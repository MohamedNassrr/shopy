import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_shop_app/core/styles/texts_styles.dart';
import 'package:online_shop_app/core/widgets/custom_text_field.dart';
import 'package:online_shop_app/features/home/presentation/controller/product_cubit/product_cubit.dart';
import 'package:online_shop_app/features/home/presentation/controller/product_cubit/product_states.dart';
import 'package:online_shop_app/features/home/presentation/views/widgets/category_list_view.dart';
import 'package:online_shop_app/features/home/presentation/views/widgets/custom_gird_item.dart';
import 'package:online_shop_app/features/home/presentation/views/widgets/my_carousal_slider.dart';
import 'custom_sliver_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductStates>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            const CustomSliverAppBar(),
            const SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: CustomTextField(
                      hintText: 'Search here ...',
                      prefixIcon: FontAwesomeIcons.magnifyingGlass,
                    ),
                  ),
                  MyCarousalSlider(),
                  CategoryListView(),
                  SizedBox(height: 17),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Recent product',
                      style: TextsStyles.textStyle14,
                    ),
                  ),
                  SizedBox(height: 20),
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
                          debugPrint('item pressed');
                        },
                        child:
                            CustomGridItem(productModel: state.product[index])),
                  );
                } else if (state is ProductFailureStates) {
                  return Text(
                      'there is error in product: ${state.errMessage.toString()}');
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        );
      },
    );
  }
}
