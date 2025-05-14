import 'package:bloc/bloc.dart';
import 'package:online_shop_app/features/Cart/data/models/cart_model.dart';
import 'package:online_shop_app/features/Cart/presentation/controller/cart_cubit/cart_states.dart';
import 'package:online_shop_app/features/home/data/models/product_model/product_model.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInitialStates());

  final List<CartModel> cartItem = [];

  void addToCart(ProductModel product) {
    emit(CartLoadingStates());
    final index = cartItem.indexWhere(
      (item) => item.productModel.id == product.id,
    );

    if (index != -1) {
      cartItem[index].quantity++;
    } else {
      cartItem.add(
        CartModel(
          productModel: product,
          quantity: 1,
        ),
      );
      emit(CartUpdatedStates(List.from(cartItem)));
    }
    emit(CartUpdatedStates(List.from(cartItem)));
  }

  void incCartItem(ProductModel product){
    final index = cartItem.indexWhere((item) => item.productModel.id == product.id);

    if(index != -1){
      cartItem[index].quantity++;
      emit(CartUpdatedStates(List.from(cartItem)));
    }
  }

  void decCartItem(ProductModel product){
    final index = cartItem.indexWhere((item) => item.productModel.id == product.id);

    if(index != -1 && cartItem[index].quantity > 0){
      cartItem[index].quantity--;
      emit(CartUpdatedStates(List.from(cartItem)));
    }else{
      removeItem(product);

    }
  }

  void removeItem(ProductModel product){
    cartItem.removeWhere((item) => item.productModel.id == product.id);
    emit(CartUpdatedStates(List.from(cartItem)));
  }

  double totalPrice() {
    double total = 0;
    for (var item in cartItem) {
      total += item.productModel.price! * item.quantity;
    }
    return total;
  }

  int totalProduct(){
    int totalItem = 0;
    for(var item in cartItem){
      totalItem += item.quantity;
    }
    return totalItem;
  }
}
