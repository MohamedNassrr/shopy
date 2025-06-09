import 'package:online_shop_app/features/home/data/models/product_model/product_model.dart';

abstract class SearchStates {}

class SearchInitialStates extends SearchStates {}

class SearchLoadingStates extends SearchStates {}

class SearchSuccessStates extends SearchStates {
  final List<ProductModel> productModel;

  SearchSuccessStates(this.productModel);
}

class SearchFailureStates extends SearchStates {
  final String failure;

  SearchFailureStates(this.failure);
}
