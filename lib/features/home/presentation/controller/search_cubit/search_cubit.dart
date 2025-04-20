import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:online_shop_app/features/home/data/repos/home_repo.dart';
import 'package:online_shop_app/features/home/presentation/controller/search_cubit/search_states.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit(this.homeRepo) : super(SearchInitialStates());

  final HomeRepo homeRepo;

  Future<void> fetchSearchItems({required String query}) async {
    emit(SearchLoadingStates());
    var result = await homeRepo.fetchSearch(query: query);
    result.fold(
      (failure) {
        emit(SearchFailureStates(failure.errMessage));
        log(failure.errMessage.toString());
      },
      (success) {
        emit(SearchSuccessStates(success));
      },
    );
  }


}
