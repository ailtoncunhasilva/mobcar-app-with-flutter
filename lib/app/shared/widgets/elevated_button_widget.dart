import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final Size? minimunSize;
  final String text;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry? padding;

  ElevatedButtonWidget({
    this.minimunSize,
    this.padding,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          minimumSize: minimunSize,
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
