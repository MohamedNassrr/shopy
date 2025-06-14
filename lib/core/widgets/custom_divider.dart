import 'package:flutter/material.dart';
import 'package:online_shop_app/generated/l10n.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: 260,
      child: Row(
        spacing: 10,
        children: [
          const Expanded(child: Divider()),
          Text(S.of(context).orText),
          const Expanded(child: Divider()),
        ],
      ),
    );
  }
}
