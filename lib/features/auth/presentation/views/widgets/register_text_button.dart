import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_shop_app/core/utils/app_router.dart';
import 'package:online_shop_app/generated/l10n.dart';

class RegisterTextButton extends StatelessWidget {
  const RegisterTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 3.2,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text(S.of(context).registryText),
        InkWell(
          onTap: () {
            GoRouter.of(context).push(AppRouter.rRegisterView);
          },
          child: Text(
            S.of(context).register.toUpperCase(),
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
         Text(S.of(context).now),
      ],
    );
  }
}
