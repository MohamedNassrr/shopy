import 'package:dartz/dartz.dart';
import 'package:online_shop_app/core/errors/apis_failures.dart';
import 'package:online_shop_app/features/category/data/models/category_model/category_model.dart';

abstract class CatRepo{
  Future<Either<ApisFailure,List<CategoryModel>>> fetchCategory();
}