import 'package:flutter/material.dart';
import 'package:online_shop_app/core/styles/texts_styles.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errorMessage});

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        style: TextsStyles.textStyle18,
      ),
    );
  }
}
