import 'package:flutter/material.dart';
import 'package:online_shop_app/constance.dart';

class  CustomCircleIndicator extends StatelessWidget {
  const  CustomCircleIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      color: primaryColor,

    );
  }
}