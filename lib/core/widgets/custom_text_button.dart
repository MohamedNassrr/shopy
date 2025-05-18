import 'package:flutter/material.dart';
import 'package:online_shop_app/constance.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    this.width = double.infinity,
    this.height = 45,
    this.colors = primaryColor,
    required this.onPressed,
    required this.text,
    this.textColor = Colors.white,
    this.radius = 4,
    this.isLoading = false,
    this.pressedColor = false,
  });

  final double? width;
  final double? height;
  final Color colors;
  final Function() onPressed;
  final String text;
  final Color textColor;
  final double radius;
  final bool isLoading;
  final bool pressedColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: colors,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: isLoading
          ? const Center(
              child: CircularProgressIndicator(
              color: Colors.white,
            ))
          : TextButton(
              onPressed: onPressed,
              child: Text(
                text,
                style: TextStyle(color: textColor),
              ),
            ),
    );
  }
}
