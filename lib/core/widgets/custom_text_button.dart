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
    this.isDisabled = false,
    this.isDark = false,
  });

  final double? width;
  final double? height;
  final Color colors;
  final Function() onPressed;
  final String text;
  final Color textColor;
  final double radius;
  final bool isLoading;
  final bool isDisabled;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: isDisabled || isDark ? Colors.grey : colors,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: isLoading
          ? const Center(
              child: CircularProgressIndicator(
              color: Colors.white,
            ))
          : TextButton(
              onPressed: isDisabled ? null : onPressed ,
              child: Text(
                text,
                style: TextStyle(color: textColor),
              ),
            ),
    );
  }
}
