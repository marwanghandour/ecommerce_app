import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? backgroundImage;
  final Widget? leading;
  final List<Widget>? actions;
  final double expandedHeight;
  final bool Ispinned;

  const CustomSliverAppBar({
    super.key,
    this.title,
    this.subtitle,
    this.backgroundImage,
    this.leading,
    this.actions,
    this.expandedHeight = 200.0, required this.Ispinned,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: Ispinned,
      expandedHeight: expandedHeight,
      flexibleSpace: FlexibleSpaceBar(
        title: title != null ? Text(title!) : null,
        background: backgroundImage != null
            ? Image.network(
                backgroundImage!,
                fit: BoxFit.cover,
              )
            : null,
      ),
      leading: leading,
      actions: actions,
    );
  }
}
