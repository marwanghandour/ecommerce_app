import 'package:ecommerce_app/src/features/presentation/app_routes.dart';
import 'package:ecommerce_app/src/features/presentation/widgets/main_components/categroy_item.dart';
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
  }
  ),
          const SizedBox(width: 10),
          CategoryItem(
            imagePath: 'assets/images/jew.png',
            onTap: () {
              Navigator.pushNamed(context, 
              AppRoutes.jewllery,
              );
            },
          ),
          const SizedBox(width: 10),
          CategoryItem(
            imagePath: 'assets/images/cloth.png',
            onTap: () {
               Navigator.pushNamed(context, 
              AppRoutes.clothing,
              );
            },
          ),
        ],
      ),
    );
  }
}

