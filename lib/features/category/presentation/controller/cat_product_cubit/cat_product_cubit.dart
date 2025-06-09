import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:online_shop_app/features/category/data/repos/cat_repo.dart';
import 'package:online_shop_app/features/category/presentation/controller/cat_product_cubit/cat_product_states.dart';

class CatProductCubit extends Cubit<CatProductStates> {
  CatProductCubit(this.catRepo) : super(CatProductInitialState());

  final CatRepo catRepo;

  Future<void> fetchCatProduct(String categorySlug) async {
    emit(CatProductLoadingState());
    var result = await catRepo.fetchCategoryProduct(categorySlug);

    result.fold((failure) {
      emit(CatProductFailureState(failure.errMessage));
      log(failure.errMessage.toString());
    }, (product) {
      emit(CatProductSuccessState(product));
    });
  }
}
