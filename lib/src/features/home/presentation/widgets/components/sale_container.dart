import 'package:ecommerce_app/src/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SaleContainer extends StatelessWidget {
  const SaleContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          margin: const EdgeInsets.only(right: 20, left: 25),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.primaryDark,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20),
          ),
          width: 360,
          height: 55,
          child: const Text(
            'Delivery is 50% Cheaper',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        );
  }
}