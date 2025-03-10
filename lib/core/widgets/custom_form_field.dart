import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.type,
    this.onSubmit,
    this.radius = 16,
    required this.validation,
    this.suffix,
    this.suffixPressed,
    this.isPassword = false,
  });

  final TextEditingController controller;
  final String hintText;
  final TextInputType type;
  final Function(String)? onSubmit;
  final Function()? suffixPressed;
  final FormFieldValidator<String> validation;
  final double radius;
  final IconData? suffix;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onSubmit,
      obscureText: isPassword,
      validator: validation,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        hintText: hintText,
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
      ),
    );
  }
}
