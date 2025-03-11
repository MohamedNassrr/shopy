

abstract class CategoryStates{}

class CategoryInitialStates extends CategoryStates{}

class CategoryLoadingStates extends CategoryStates{}

class CategorySuccessStates extends CategoryStates{

}

class CategoryFailureStates extends CategoryStates{
  final String failure;

  CategoryFailureStates(this.failure);
}