import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:online_shop_app/core/utils/assets_data.dart';
import 'package:online_shop_app/features/Cart/presentation/views/cart_view.dart';
import 'package:online_shop_app/features/home/presentation/controller/home_cubit/home_states.dart';
import 'package:online_shop_app/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:online_shop_app/features/settings/presentation/views/settings_view.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialStates());

  List<String> banners = [
    AssetsData.firstBanner,
    AssetsData.secondBanner,
    AssetsData.thirdBanner,
  ];

  List<Widget> screens = [
    const HomeViewBody(),
    const CartView(),
    const SettingsView(),
  ];



  int currentIndex = 0;

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 1) {
      const CartView();
    }
    if (index == 2) {
      const SettingsView();
    }
    emit(HomeChangeNavStates());
  }

 setLocation(String locationName)  {
    emit(HomeSetLocationNameStates(locationName));
    return locationName;
  }
}
