import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search_rounded,
          color: Color(0xff939393),
          size: 30,
        ),
        contentPadding: EdgeInsets.symmetric(),
        hintText: 'Search here ...',
        hintStyle: TextStyle(
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
      borderSide: BorderSide(
        color: Color(0xffC8C8CB),
      ),
    );
  }

}