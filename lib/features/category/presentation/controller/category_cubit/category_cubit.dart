import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:online_shop_app/core/utils/assets_data.dart';
import 'package:online_shop_app/features/category/data/repos/cat_repo.dart';
import 'package:online_shop_app/features/category/presentation/controller/category_cubit/category_states.dart';

class CategoryCubit extends Cubit<CategoryStates> {
  CategoryCubit(this.catRepo) : super(CategoryInitialStates());

  List<String> imageIcon = [
    AssetsData.beautyIcon,
    AssetsData.clothesIcon,
    AssetsData.decorationIcon,
    AssetsData.electronicsIcon,
  ];

  final CatRepo catRepo;

  Future<void> fetchCategories() async {
    emit(CategoryLoadingStates());
    var result = await catRepo.fetchCategory();

    result.fold(
      (failure) {
        emit(CategoryFailureStates(failure.errMessage));
        log('failure is:${failure.errMessage.toString()}');
      },
      (categories) {
        emit(CategorySuccessStates(categories));
      },
    );
  }
}
