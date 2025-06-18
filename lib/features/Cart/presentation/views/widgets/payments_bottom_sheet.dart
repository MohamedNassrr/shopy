import 'package:flutter/material.dart';
import 'package:online_shop_app/features/Cart/presentation/views/widgets/credit_card_bottom_sheet.dart';
import 'package:online_shop_app/features/Cart/presentation/views/widgets/paypal_bottom_sheet.dart';
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
            CreditCardBottomSheet(lang: lang),
            PaypalBottomSheet(lang: lang),
          ],
        ),
      ),
    );
  }
}


