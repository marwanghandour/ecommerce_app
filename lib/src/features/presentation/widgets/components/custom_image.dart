import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/src/core/utils/app_icons.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({super.key, required this.imageUrl});

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: imageUrl,
        errorWidget: (context, url, error) => const Icon(color: Colors.red,
          AppIcons.error,
        ),
      ),
    );
  }
}
