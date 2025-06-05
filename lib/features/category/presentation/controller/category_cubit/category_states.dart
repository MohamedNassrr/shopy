import 'package:online_shop_app/features/category/data/models/category_model/category_model.dart';

abstract class CategoryStates{}

class CategoryInitialStates extends CategoryStates{}

class CategoryLoadingStates extends CategoryStates{}

class CategorySuccessStates extends CategoryStates{
  final List<CategoryModel> categories;

  CategorySuccessStates(this.categories);
}

class CategoryFailureStates extends CategoryStates{
  final String failure;

  CategoryFailureStates(this.failure);
}