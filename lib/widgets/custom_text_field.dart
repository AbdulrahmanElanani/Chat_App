import 'package:flutter/material.dart';

import '../pages/register_page.dart';
import 'constants.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    this.controller,
    this.onSubmitted,
    super.key,
  });
  TextEditingController? controller;
  Function(String value)? onSubmitted;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: controller,
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: kPrimaryColor,
            ),
          ),
          suffixIcon: IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, RegisterPage.id);
              },
              icon: const Icon(
                Icons.send,
              )),
          suffixIconColor: kPrimaryColor,
        ),
      ),
    );
  }
}
