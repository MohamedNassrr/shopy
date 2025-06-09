import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop_app/core/services/service_locator.dart';
import 'package:online_shop_app/features/category/data/models/category_model/category_model.dart';
import 'package:online_shop_app/features/category/data/repos/cat_repo_impl.dart';
import 'package:online_shop_app/features/category/presentation/controller/cat_product_cubit/cat_product_cubit.dart';
import 'package:online_shop_app/features/category/presentation/views/widgets/category_product_body.dart';

class CategoryProductView extends StatelessWidget {
  const CategoryProductView({super.key, required this.categoryModel});

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CatProductCubit(getIt.get<CatRepoImpl>())..fetchCatProduct(categoryModel.slug!),
      child: Scaffold(
        appBar: AppBar(),
        body:  const CategoryProductBody(),
      ),
    );
  }
}
