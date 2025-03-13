import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_shop_app/core/styles/texts_styles.dart';
import 'package:online_shop_app/features/home/presentation/controller/product_cubit/product_cubit.dart';
import 'package:online_shop_app/features/home/presentation/controller/product_cubit/product_states.dart';
import 'package:online_shop_app/features/home/presentation/views/widgets/category_list_view.dart';
import 'package:online_shop_app/features/home/presentation/views/widgets/custom_gird_item.dart';
import 'package:online_shop_app/features/home/presentation/views/widgets/custom_text_field.dart';
import 'package:online_shop_app/features/home/presentation/views/widgets/my_carousal_slider.dart';

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
            SliverAppBar(
              pinned: true,
              leading: IconButton(
                onPressed: () {
                  debugPrint('user pressed');
                },
                icon: const Icon(
                  FontAwesomeIcons.circleUser,
                  size: 23,
                  color: Colors.black,
                ),
              ),
              titleSpacing: 0,
              title:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Delivery address',
                    style: TextsStyles.textStyle11,
                  ),
                  InkWell(
                      onTap: () {},
                      child: const Row(
                        children: [
                          Text(
                            'Nasr city, Cairo Egypt',
                            style: TextsStyles.textStyle12,
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_outlined,
                          ),
                        ],
                      )),
                ],
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_cart,
                    color: Colors.black,
                    size: 23,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications_none_rounded,
                    color: Colors.black,
                    size: 23,
                  ),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: Colors.white,
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Column(
                children: [
                  // CustomAppBar(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: CustomTextField(),
                  ),
                  SizedBox(height: 7),
                  MyCarousalSlider(),
                  CategoryListView(),
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
                  return CustomGridItem(productModel: state.product[index]);
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
