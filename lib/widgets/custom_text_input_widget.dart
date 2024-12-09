import 'package:flutter/material.dart';

class CustomTextInputWidget extends StatelessWidget {
  CustomTextInputWidget({
    super.key,
    this.hintTxt,
    this.onChange,
    this.obscure = false,
  });
  Function(String)? onChange;
  final String? hintTxt;
  final bool obscure;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure,
      validator: (data) {
        if (data!.isEmpty) {
          return 'value is required';
        } else {
          return null;
        }
      },
      onChanged: onChange,
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        hintText: hintTxt,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
