import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop_app/features/home/presentation/controller/home_cubit/home_cubit.dart';

class MyCarousalSlider extends StatelessWidget {
  const MyCarousalSlider({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<HomeCubit>(context);
    return CarouselSlider.builder(
      itemCount: cubit.banners.length,
      itemBuilder: (context, index, realIndex) {
        return Image.asset(
          cubit.banners[index],
          fit: BoxFit.fill,
        );
      },
      options: CarouselOptions(
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 5),
        autoPlayAnimationDuration: Duration(seconds: 2),
        autoPlayCurve: Curves.easeInOutCirc,
        scrollDirection: Axis.horizontal,
        height: MediaQuery.of(context).size.height * 0.2,
      ),
    );
  }
}
