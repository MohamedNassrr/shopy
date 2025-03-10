import 'package:online_shop_app/features/home/data/models/product_model/product_model.dart';

abstract class ProductStates{}

class ProductInitialStates extends ProductStates{}

class ProductLoadingStates extends ProductStates{}

class ProductSuccessStates extends ProductStates{
  final List<ProductModel> product;

  ProductSuccessStates(this.product);
}

class ProductFailureStates extends ProductStates{
  final String errMessage;

  ProductFailureStates(this.errMessage);
}