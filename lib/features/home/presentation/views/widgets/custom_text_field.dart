import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: const Icon(
          FontAwesomeIcons.magnifyingGlass,
          color: Color(0xff939393),
          size: 20,
        ),
        contentPadding: const EdgeInsets.symmetric(),
        hintText: 'Search here ...',
        hintStyle: const TextStyle(
          fontSize: 14,
          color: Color(0xffC8C8CB),
        ),
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
