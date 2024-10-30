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
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.shade500,
      ),
      child: IconButton(
        icon: icon,
        onPressed: onPressed,
      ),
    );
  }
}
