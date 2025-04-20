import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:online_shop_app/core/errors/apis_failures.dart';
import 'package:online_shop_app/core/services/api_service.dart';
import 'package:online_shop_app/features/home/data/models/category_model.dart';
import 'package:online_shop_app/features/home/data/models/product_model/product_model.dart';
import 'package:online_shop_app/features/home/data/models/search_model/search_model.dart';
import 'package:online_shop_app/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<ApisFailure, List<CategoryModel>>> fetchCategory() async {
    try {
      var data = await apiService.get(endPoint: '/products/categories');

      List<CategoryModel> category = [];
      for (int i = 0; i < data.length; i++) {
        try {
          category.add(CategoryModel.fromJson(data[i]));
        } catch (e) {
          category.add(CategoryModel.fromJson(data[i]));
        }
      }
      return right(category);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailures.fromDioError(e));
      }
      return left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<ApisFailure, List<ProductModel>>> fetchProducts() async {
    try {
      var data = await apiService.get(
        endPoint: '/products',
      );
      List<ProductModel> productModel = [];
      for (var product in data['products']) {
        try {
          productModel.add(ProductModel.fromJson(product));
        } catch (e) {
          productModel.add(ProductModel.fromJson(product));
        }
      }
      return right(productModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailures.fromDioError(e));
      }
      return left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<ApisFailure, List<SearchModel>>> fetchSearch({required String query}) async {
    try {
      var data = await apiService.get(endPoint: 'products/search?q=$query');
      List<SearchModel> searchModel = [];
      for (var item in data['products']) {
        try {
          searchModel.add(SearchModel.fromJson(item));
        } catch (e) {
          searchModel.add(SearchModel.fromJson(item));
        }
      }
      return right(searchModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailures.fromDioError(e));
      }
      return left(ServerFailures(e.toString()));
    }
  }
}
