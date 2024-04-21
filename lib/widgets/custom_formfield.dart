import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String hintString;
  final double height;

  const CustomFormField(
      {super.key, required this.hintString, required this.height,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextFormField(
        decoration: InputDecoration(
            hintText: hintString,
            border: const OutlineInputBorder()
        ),
      ),
    );
  }
}
