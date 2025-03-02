import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop_app/features/home/presentation/controller/home_cubit/home_cubit.dart';
import 'package:online_shop_app/features/home/presentation/controller/home_cubit/home_states.dart';
import 'package:online_shop_app/features/home/presentation/views/widgets/category_list_view.dart';
import 'package:online_shop_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:online_shop_app/features/home/presentation/views/widgets/my_carousal_slider.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 7,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              MyCarousalSlider(),
              CategoryListView(),
            ],
          ),
        );
      },
    );
  }
}

