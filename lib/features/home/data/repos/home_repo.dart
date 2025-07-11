import 'package:dartz/dartz.dart';
import 'package:online_shop_app/core/errors/apis_failures.dart';
import 'package:online_shop_app/features/home/data/models/product_model/product_model.dart';

abstract class HomeRepo{
  Future<Either<ApisFailure,List<ProductModel>>> fetchProducts();
  Future<Either<ApisFailure,List<ProductModel>>> fetchSearch({required String query});
}