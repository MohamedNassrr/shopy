import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:online_shop_app/core/errors/apis_failures.dart';
import 'package:online_shop_app/core/services/api_service.dart';
import 'package:online_shop_app/core/utils/end_points.dart';
import 'package:online_shop_app/features/category/data/models/category_model/category_model.dart';
import 'package:online_shop_app/features/category/data/repos/cat_repo.dart';
import 'package:online_shop_app/features/home/data/models/product_model/product_model.dart';

class CatRepoImpl implements CatRepo {
  final ApiService apiService;

  CatRepoImpl(this.apiService);

  @override
  Future<Either<ApisFailure, List<CategoryModel>>> fetchCategory() async {
    try {
      var data = await apiService.get(endPoint: ApiEndPoints.category);
      final List<dynamic> categoriesList = data;
      return right(
          categoriesList.map((json) => CategoryModel.fromJson(json)).toList());
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailures.fromDioError(e));
      }
      return left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<ApisFailure, List<ProductModel>>> fetchCategoryProduct(
      String categorySlug) async {
    try {
      var data = await apiService.get(endPoint: '${ApiEndPoints.categoryProduct}/$categorySlug');
      List<ProductModel> productModel = [];
      for (var product in data['products']) {
        try {
          productModel.add(ProductModel.fromJson(product));
        } catch (e) {
          productModel.add(ProductModel.fromJson(product));
        }
      } return right(productModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailures.fromDioError(e));
      }
      return left(ServerFailures(e.toString()));
    }
  }
}
