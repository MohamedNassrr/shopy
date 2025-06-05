import 'package:flutter/material.dart';
import 'package:online_shop_app/features/category/presentation/views/widgets/beauty_view_body.dart';

class BeautyView extends StatelessWidget {
  const BeautyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const BeautyViewBody(),
    );
  }
}
