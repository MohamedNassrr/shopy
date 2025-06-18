import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_shop_app/core/widgets/custom_button.dart';
import 'package:online_shop_app/generated/l10n.dart';

class PaypalBottomSheet extends StatelessWidget {
  const PaypalBottomSheet({
    super.key,
    required this.lang,
  });

  final S lang;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: CustomButton(
        onTap: () {},
        icon: FontAwesomeIcons.ccPaypal,
        iconColor: Colors.blue,
        iconSize: 25,
        text: lang.paypal,
        width: double.infinity,
        height: 45,
      ),
    );
  }
}
