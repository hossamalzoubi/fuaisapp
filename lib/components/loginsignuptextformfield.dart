import 'package:flutter/material.dart';

import '../constant.dart';
class CustomTextFormFieldLoginSignUp extends StatelessWidget {
  const CustomTextFormFieldLoginSignUp(
      {super.key,
      required this.labelText,
      required this.hintText,
      required this.onSave,
      required this.validator,
      this.obscureText = false});
  final String labelText;
  final String hintText;
  final bool obscureText;
  final Function(String?) onSave;
  final String ?Function(String?) validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onSaved: onSave,
      decoration: InputDecoration(
          filled: true,
          fillColor: logInSignUpColor,
          labelText: labelText,
          hintText: hintText,
          labelStyle: const TextStyle(color: textColor, fontSize: 20),
          hintStyle: const TextStyle(color: Color(0xffb7b5b3)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: logInSignUpColor)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: logInSignUpColor)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: logInSignUpColor)),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 30)),
    );
  }
}
