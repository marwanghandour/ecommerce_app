import 'package:flutter/material.dart';

class IconContainer extends StatelessWidget {
  final Icon icon;
  final VoidCallback? onPressed;

  const IconContainer({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: IconButton(
        icon: icon,
        onPressed: onPressed,
      ),
    );
  }
}
