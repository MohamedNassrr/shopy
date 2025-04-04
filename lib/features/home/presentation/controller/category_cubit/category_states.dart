

import 'package:online_shop_app/features/home/data/models/category_model.dart';

abstract class CategoryStates{}

class CategoryInitialStates extends CategoryStates{}

class CategoryLoadingStates extends CategoryStates{}

class CategorySuccessStates extends CategoryStates{
  final List<CategoryModel> category;

  CategorySuccessStates(this.category);
}

class CategoryFailureStates extends CategoryStates{
  final String failure;

  CategoryFailureStates(this.failure);
}