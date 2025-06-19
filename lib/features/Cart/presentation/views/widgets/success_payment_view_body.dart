import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:online_shop_app/core/utils/app_router.dart';
import 'package:online_shop_app/generated/l10n.dart';

class SuccessPaymentViewBody extends StatelessWidget {
  const SuccessPaymentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 65,
          backgroundColor: Colors.green[300],
          child: const CircleAvatar(
            backgroundColor: Colors.green,
            radius: 55,
            child: Icon(
              FontAwesomeIcons.check,
              size: 40,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: Column(
            spacing: 5,
            children: [
              Text(
                S.of(context).thankYou,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                S.of(context).transactionSuccessful,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.black54,
                    ),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () {
            GoRouter.of(context).pushReplacement(AppRouter.rHomeView);
          },
          child: Text(
            S.of(context).backToHome,
            style: const TextStyle(
              color: Colors.green,
            ),
          ),
        ),
      ],
    );
  }
}
