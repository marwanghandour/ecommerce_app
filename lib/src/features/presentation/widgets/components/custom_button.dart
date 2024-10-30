import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;

  final VoidCallback onPressed;
  final double elevation;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry padding;
  final Color? color;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.elevation = 2.0,
    this.borderRadius = const BorderRadius.only(
      topLeft: Radius.circular(8.0),
      bottomRight: Radius.circular(8.0),
    ),
    this.padding = const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0), this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
        padding: padding,
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white,fontSize: 16.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
