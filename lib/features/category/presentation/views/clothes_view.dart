import 'package:flutter/material.dart';
import 'package:online_shop_app/features/category/presentation/views/widgets/clothes_view_body.dart';

class ClothesView extends StatelessWidget {
  const ClothesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const ClothesViewBody(),
    );
  }
}
