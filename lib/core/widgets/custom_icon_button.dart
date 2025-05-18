import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.onTap,
    required this.icon,
    this.borderColor,
  });

  final Function() onTap;
  final double width = 25;
  final double height = 25;
  final double borderRadius = 5;
  final IconData icon;
  final double iconSize = 15;
  final Color? borderColor;

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
        child: Icon(
          icon,
          size: iconSize,
        ),
      ),
    );
  }
}
