import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:online_shop_app/features/Cart/data/repos/cart_repo.dart';
import 'package:online_shop_app/features/Cart/presentation/controller/cart_cubit/cart_states.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit(this.cartRepo) : super(CartInitialStates());

  int counter = 1;

  void counterAdd() {
    counter++;
    emit(CartCounterAddStates());
  }

  void counterMinus() {
    if (counter >= 1) {
      counter--;
      emit(CartCounterMinusStates());
    }
  }

  final CartRepo cartRepo;

  Future<void> fetchCartItem() async {
    emit(CartLoadingStates());
    var result = await cartRepo.fetchCartItems();

    result.fold(
      (failure) {
        emit(CartFailureStates(failure.errMessage));
        log(failure.errMessage.toString());
      },
      (cart) {
        emit(CartSuccessStates(cart));
      },
    );
  }




}
