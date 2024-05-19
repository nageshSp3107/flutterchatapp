import 'package:flutter/material.dart';

class OutlinedTextFormField extends StatelessWidget {
  final String hintString;
  final double height;
  final RegExp validationRegExp;
  final bool obsecureText;
  final void Function(String?) onSaved;

  const OutlinedTextFormField({
    super.key,
    required this.hintString,
    required this.height,
    required this.validationRegExp,
    required this.onSaved,
    this.obsecureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextFormField(
        onSaved: onSaved,
        obscureText: obsecureText,
        validator: (value) {
          if (value != null && validationRegExp.hasMatch(value)) {
            return null;
          }
          return "Enter a valid ${hintString.toLowerCase()}";
        },
        decoration: InputDecoration(
            hintText: hintString, border: const OutlineInputBorder()),
      ),
    );
  }
}
