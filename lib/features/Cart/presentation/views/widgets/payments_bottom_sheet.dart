import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:online_shop_app/core/utils/app_router.dart';
import 'package:online_shop_app/core/widgets/custom_button.dart';
import 'package:online_shop_app/generated/l10n.dart';

class PaymentBottomSheet extends StatelessWidget {
  const PaymentBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    return SizedBox(
      width: double.infinity,
      height: 225,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 15,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: const BorderRadius.all(Radius.circular(5))),
              child: CustomButton(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.rCreditView);
                },
                icon: FontAwesomeIcons.ccVisa,
                iconSize: 25,
                text: lang.creditCard,
                iconColor: Colors.blue,
                width: double.infinity,
                height: 45,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: const BorderRadius.all(Radius.circular(5))),
              child: CustomButton(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.rPaypalView);
                },
                icon: FontAwesomeIcons.ccPaypal,
                iconColor: Colors.blue,
                iconSize: 25,
                text: lang.paypal,
                width: double.infinity,
                height: 45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
