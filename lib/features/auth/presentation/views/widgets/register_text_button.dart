import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_shop_app/core/utils/app_router.dart';

class RegisterTextButton extends StatelessWidget {
  const RegisterTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 3.2,
      children: [
        const Text('Don\'t have an account yet?'),
        InkWell(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kRegisterView);
          },
          child: Text(
            'Register'.toUpperCase(),
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
        const Text('Now'),
      ],
    );
  }
}
