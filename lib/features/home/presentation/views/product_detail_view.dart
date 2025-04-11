import 'package:flutter/material.dart';
import 'package:online_shop_app/features/home/data/models/product_model/product_model.dart';
import 'package:online_shop_app/features/home/presentation/views/widgets/product_detail_view_body.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: ProductDetailViewBody(
          product: productModel,
        ),
      ),
    );
  }
}
