import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_shop_app/core/widgets/custom_button.dart';
import 'package:online_shop_app/generated/l10n.dart';

class CreditCardBottomSheet extends StatelessWidget {
  const CreditCardBottomSheet({
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
        icon: FontAwesomeIcons.ccVisa,
        iconSize: 25,
        text: lang.creditCard,
        iconColor: Colors.blue,
        width: double.infinity,
        height: 45,
      ),
    );
  }
}
