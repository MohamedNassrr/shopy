import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_shop_app/core/widgets/custom_button.dart';

class ProductShowSheetItem extends StatelessWidget {
  const ProductShowSheetItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 200,
        width: double.infinity,
        child: Column(
          spacing: 10,
          children: [
            CustomButton(
              onTap: () {},
              mainAxisAlignment: MainAxisAlignment.center,
              icon: FontAwesomeIcons.ccVisa,
              iconColor: Colors.white,
              borderColor: Colors.black,
              iconSize: 20,
              text: 'Pay with credit',
              textColor: Colors.white,
              width: double.infinity,
              height: 50,
            ),
            CustomButton(
              onTap: () {},
              mainAxisAlignment: MainAxisAlignment.center,
              borderColor: Colors.black,

              icon: FontAwesomeIcons.ccPaypal,
              iconColor: Colors.white,
              iconSize: 20,
              text: 'Pay with PayPal',
              textColor: Colors.white,
              width: double.infinity,
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
