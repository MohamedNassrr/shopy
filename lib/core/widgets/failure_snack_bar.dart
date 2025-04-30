import 'package:flutter/material.dart';

class FailureSnackBar extends StatelessWidget {
  const FailureSnackBar({super.key, required this.errMessage,});

  final String errMessage;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 2.5,
      children: [
        const Icon(
          Icons.error_outline,
          color: Colors.white,

        ),
        Text(errMessage),
      ],
    );
  }
}
