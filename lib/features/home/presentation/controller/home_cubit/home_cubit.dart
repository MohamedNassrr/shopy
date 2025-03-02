import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_shop_app/core/utils/assets_data.dart';
import 'package:online_shop_app/features/cart/presentation/views/cart_view.dart';
import 'package:online_shop_app/features/home/presentation/controller/home_cubit/home_states.dart';
import 'package:online_shop_app/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:online_shop_app/features/profile/presentation/views/profile_view.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialStates());

  List<String> banners = [
    AssetsData.firstBanner,
    AssetsData.secondBanner,
    AssetsData.thirdBanner,
  ];
  List<String> imageIcon = [
    AssetsData.clothesIcon,
    AssetsData.electronicsIcon,
    AssetsData.sportIcon,
    AssetsData.categoryIcon
  ];
  List<String> categoryTitles = [
    'Clothes',
    'Electronics',
    'Sports',
    'All',
  ];

  List<Widget> screens = [
    HomeViewBody(),
    CartView(),
    ProfileView(),
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

  int currentIndex = 0;

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 1) {
      const CartView();
    }
    if (index == 2) {
      const ProfileView();
    }

    emit(HomeChangeNavStates());
  }
}
