import 'package:online_shop_app/features/home/data/models/search_model/search_model.dart';

abstract class SearchStates {}

class SearchInitialStates extends SearchStates {}

class SearchLoadingStates extends SearchStates {}

class SearchSuccessStates extends SearchStates {
  final List<SearchModel> searchModel;

  SearchSuccessStates(this.searchModel);
}

class SearchFailureStates extends SearchStates {
  final String failure;

  SearchFailureStates(this.failure);
}
