import 'package:flutter/material.dart';
import 'package:online_shop_app/features/home/presentation/views/widgets/category_list_view.dart';
import 'package:online_shop_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:online_shop_app/features/home/presentation/views/widgets/custom_grid_list.dart';
import 'package:online_shop_app/features/home/presentation/views/widgets/my_carousal_slider.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              CustomAppBar(),
              MyCarousalSlider(),
              CategoryListView(),
              SizedBox(height: 20),
            ],
          ),
        ),

        SliverToBoxAdapter(
          child:  CustomGridList(),
        ),
      ],
    );
  }
}
