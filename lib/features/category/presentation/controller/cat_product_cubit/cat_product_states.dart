import 'package:online_shop_app/features/home/data/models/product_model/product_model.dart';

abstract class CatProductStates{}

class CatProductInitialState extends CatProductStates{}

class CatProductLoadingState extends CatProductStates{}

class CatProductSuccessState extends CatProductStates{
  final List<ProductModel> product;

  CatProductSuccessState(this.product);
}

class CatProductFailureState extends CatProductStates{
  final String errMessage;

  CatProductFailureState(this.errMessage);
}

