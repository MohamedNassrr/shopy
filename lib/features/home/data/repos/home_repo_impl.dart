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
  Future<Either<ApisFailure, List<CategoryModel>>> fetchCategory() {
    // TODO: implement fetchCategory
    throw UnimplementedError();
  }

  @override
  Future<Either<ApisFailure, List<ProductModel>>> fetchProducts() async {
    try {
      var data = await apiService.getProduct(
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
  Future<Either<ApisFailure, List<SearchModel>>> fetchSearch() {
    // TODO: implement fetchSearch
    throw UnimplementedError();
  }
}
