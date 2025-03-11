import 'package:bloc/bloc.dart';
import 'package:online_shop_app/core/utils/assets_data.dart';
import 'package:online_shop_app/features/home/presentation/controller/category_cubit/category_states.dart';

class CategoryCubit extends Cubit<CategoryStates> {
  CategoryCubit() : super(CategoryInitialStates());

  List<String> categoryTitles = [
    'Clothes',
    'Electronics',
    'Shoes',
    'All',
  ];
  List<String> imageIcon = [
    AssetsData.clothesIcon,
    AssetsData.electronicsIcon,
    AssetsData.sportIcon,
    AssetsData.categoryIcon
  ];

}
