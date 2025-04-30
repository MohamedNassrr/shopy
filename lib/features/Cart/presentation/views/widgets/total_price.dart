import 'package:flutter/material.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Total',
        ),
        Text(
          '\$ 00.00',
        ),
      ],
    );
  }
}
