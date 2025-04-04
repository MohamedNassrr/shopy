import 'package:bloc/bloc.dart';
import 'package:online_shop_app/core/utils/assets_data.dart';
import 'package:online_shop_app/features/home/presentation/controller/category_cubit/category_states.dart';

class CategoryCubit extends Cubit<CategoryStates> {
  CategoryCubit() : super(CategoryInitialStates());

  List<String> categoryTitles = [
    'Beauty',
    'Clothes',
    'Perfumes',
    'Decorations',
    'Electronics',
  ];
  List<String> imageIcon = [
    AssetsData.beautyIcon,
    AssetsData.clothesIcon,
    AssetsData.perfumesIcon,
    AssetsData.decorationIcon,
    AssetsData.electronicsIcon,
  ];

  // final HomeRepo homeRepo;
  //
  // Future<void> fetchCategoryModel() async {
  //   var result = await homeRepo.fetchCategory();
  //
  //   result.fold((failure) {
  //     emit(CategoryFailureStates(failure.errMessage));
  //   }, (category) {
  //     emit(CategorySuccessStates(category));
  //   });
  // }
}
