import 'package:online_shop_app/features/home/data/models/product_model/product_model.dart';

class CartModel {
  final ProductModel productModel;
  int quantity;

  CartModel({
    required this.productModel,
    required this.quantity,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        productModel: ProductModel.fromJson(json['productModel']),
        quantity: json['quantity'],
      );

  Map<String, dynamic> toJson() => {
        'productModel': productModel.toJson(),
        'quantity': quantity,
      };
}
