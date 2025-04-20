import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.prefixIcon,
    required this.hintText,
    this.fillColor,
    this.isFilled,
    this.controller,
    this.suffixIcon,
    this.suffixPressed,
    this.onTap,
  });

  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function()? suffixPressed;
  final String hintText;
  final Color? fillColor;
  final bool? isFilled;
  final dynamic controller;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: onTap,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.grey,
          size: 20,
        ),
        suffixIcon: suffixIcon != null
            ? IconButton(
          onPressed: suffixPressed,
          icon: Icon(
            suffixIcon,
            size: 15.8,
            color: Colors.grey,
          ),
        )
            : null,
        contentPadding: const EdgeInsets.symmetric(),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 14,
          color: Colors.grey,
        ),
        fillColor: fillColor,
        filled: isFilled,
        border: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Color(0xffC8C8CB),
      ),
    );
  }
}
