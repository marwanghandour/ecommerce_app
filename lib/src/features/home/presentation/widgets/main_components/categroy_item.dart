import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;
  final String title;

  const CategoryItem({
    super.key,
    required this.imagePath,
    required this.onTap, 
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Expanded(child: Image.asset(imagePath)),
          const SizedBox(height: 10,),
          Text(title, style: const TextStyle(
            fontSize: 15, 
            fontWeight: FontWeight.w600
          ),),
        ],
      ),
    );
  }
}
