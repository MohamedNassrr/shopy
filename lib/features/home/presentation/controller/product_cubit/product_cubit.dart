import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:online_shop_app/features/home/data/repos/home_repo.dart';
import 'package:online_shop_app/features/home/presentation/controller/product_cubit/product_states.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit(this.homeRepo) : super(ProductInitialStates());

  final HomeRepo homeRepo;

  Future<void> fetchProductData() async {
    emit(ProductLoadingStates());
    var result = await homeRepo.fetchProducts();

    result.fold((failure) {
      emit(ProductFailureStates(failure.errMessage));
      log(failure.errMessage.toString());
    }, (product) {
      emit(ProductSuccessStates(product));
    });
  }
}
