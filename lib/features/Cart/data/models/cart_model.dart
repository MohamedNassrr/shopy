import 'package:online_shop_app/features/home/data/models/product_model/product_model.dart';

class CartModel {
  final ProductModel productModel;
  int quantity;

  CartModel({
    required this.productModel,
    required this.quantity ,
  });
}
