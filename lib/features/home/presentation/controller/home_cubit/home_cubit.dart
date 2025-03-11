import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_shop_app/core/utils/assets_data.dart';
import 'package:online_shop_app/features/home/presentation/controller/home_cubit/home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialStates());

  List<String> banners = [
    AssetsData.firstBanner,
    AssetsData.secondBanner,
    AssetsData.thirdBanner,
  ];
  List<BottomNavigationBarItem> bottomNavItem = [
    BottomNavigationBarItem(
        icon: Icon(
          FontAwesomeIcons.house,
        ),
        label: 'Home'),
    BottomNavigationBarItem(
        icon: Icon(
          FontAwesomeIcons.cartShopping,
        ),
        label: 'Cart'),
    BottomNavigationBarItem(
        icon: Icon(
          FontAwesomeIcons.user,
        ),
        label: 'Account'),
  ];
}
