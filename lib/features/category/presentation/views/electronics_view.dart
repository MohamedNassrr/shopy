import 'package:flutter/material.dart';
import 'package:online_shop_app/features/category/presentation/views/widgets/electronics_view_body.dart';

class ElectronicsView extends StatelessWidget {
  const ElectronicsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const ElectronicsViewBody(),
    );
  }
}
