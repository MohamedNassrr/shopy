import 'package:flutter/material.dart';

class CustomHoverButton extends StatelessWidget {
  const CustomHoverButton({
    super.key,
    required this.onTap,
    required this.icon,
    this.borderColor,
    this.width = 25,
    this.height = 25,
    this.text = '',
    this.iconColor,
    this.borderRadius = 5,
    this.iconSize = 15,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.textColor,
  });

  final Function() onTap;
  final double? width;
  final double? height;
  final double borderRadius;
  final IconData icon;
  final double iconSize;
  final Color? borderColor;
  final String? text;
  final Color? iconColor;
  final Color? textColor;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: borderColor,
        ),
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          spacing: 5,
          children: [
            Icon(
              icon,
              size: iconSize,
              color: iconColor,
            ),
            Text(
              '$text',
              style: TextStyle(
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
