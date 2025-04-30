import 'package:flutter/material.dart';

class TotalProducts extends StatelessWidget {
  const TotalProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Products',
        ),
        Text(
          '4',
        ),
      ],
    );
  }
}
