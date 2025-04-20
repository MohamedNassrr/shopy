import 'package:bloc/bloc.dart';
import 'package:online_shop_app/features/Cart/presentation/controller/cart_cubit/cart_states.dart';

class CartCubit extends Cubit<CartStates>{
  CartCubit() : super(CartInitialStates());

  int counter = 1;

  void counterAdd(){
    counter ++;
    emit(CartCounterAddStates());
  }
  void counterMinus(){
    if(counter >= 1){
      counter--;
      emit(CartCounterMinusStates());
    }
  }
}