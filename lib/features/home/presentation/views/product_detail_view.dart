import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop_app/features/home/data/models/product_model/product_model.dart';
import 'package:online_shop_app/features/home/presentation/controller/product_cubit/product_cubit.dart';
import 'package:online_shop_app/features/home/presentation/views/widgets/product_detail_view_body.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({super.key, required this.productModel});

  final ProductModel productModel;



  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}
class _ProductDetailViewState extends State<ProductDetailView> {
  @override
  void initState() {
    BlocProvider.of<ProductCubit>(context).fetchProductData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: ProductDetailViewBody(
          product: widget.productModel,
        ),
      ),
    );
  }
}
