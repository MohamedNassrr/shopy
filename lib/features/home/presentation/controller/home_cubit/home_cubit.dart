import 'package:bloc/bloc.dart';
import 'package:online_shop_app/core/utils/assets_data.dart';
import 'package:online_shop_app/features/home/presentation/controller/home_cubit/home_states.dart';

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
}
