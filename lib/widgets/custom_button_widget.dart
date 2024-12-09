import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  CustomButtonWidget({
    this.action,
    super.key,
    required this.text,
  });
  final String text;
  VoidCallback? action;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        height: 50,
        width: double.infinity,
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }
}
