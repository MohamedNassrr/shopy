import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_shop_app/core/utils/app_router.dart';

class ForgetPassTextButton extends StatelessWidget {
  const ForgetPassTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topEnd,
      child: TextButton(
        onPressed: () {
          GoRouter.of(context).push(AppRouter.kForgetPassView);
        },
        child: Text(
          'Forget Password?',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}