import 'package:ecommerce_app/src/features/home/presentation/app_routes.dart';
import 'package:ecommerce_app/src/features/home/presentation/widgets/main_components/categroy_item.dart';
import 'package:flutter/material.dart';

class CategoriesRow extends StatelessWidget {
  const CategoriesRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CategoryItem(
            imagePath: 'assets/images/electronics.png',
            onTap: (){ Navigator.pushNamed(context, AppRoutes.electronics);
  },        title: 'Electronics',
  ),
          const SizedBox(width: 10),
          CategoryItem(
            imagePath: 'assets/images/shoes.png',
            onTap: () {
              Navigator.pushNamed(context, 
              AppRoutes.jewllery,
              );
            }, title: 'Shoes',
          ),
          const SizedBox(width: 10),
          CategoryItem(
            imagePath: 'assets/images/cloth.png',
            onTap: () {
               Navigator.pushNamed(context, 
              AppRoutes.clothing,
              );
            }, title: 'Fashion',
          ),
        ],
      ),
    );
  }
}

