import 'package:ecommerce_app/src/features/presentation/widgets/components/custom_image.dart';
import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? backgroundImage;
  final Widget? leading;
  final List<Widget>? actions;
  final double expandedHeight;
  final bool isPinned;

  const CustomSliverAppBar({
    super.key,
    this.title,
    this.subtitle,
    this.backgroundImage,
    this.leading,
    this.actions,
    this.expandedHeight = 200.0, required this.isPinned,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: isPinned,
      expandedHeight: expandedHeight,
      flexibleSpace: FlexibleSpaceBar(
        title: title != null ? Text(title!) : null,
        background: backgroundImage != null
            ? CustomImage(
              imageUrl: backgroundImage!,
               )
            : null,
      ),
      leading: leading,
      actions: actions,
    );
  }
}
