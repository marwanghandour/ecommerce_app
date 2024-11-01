import 'package:ecommerce_app/src/features/data/models/product_model.dart';
import 'package:ecommerce_app/src/features/presentation/app_routes.dart';
import 'package:ecommerce_app/src/features/presentation/widgets/components/custom_image.dart';
import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20), // Ensure the material matches the card's shape
      child: InkWell(
        borderRadius: BorderRadius.circular(20), // Match with the card's border radius
        splashColor: Colors.grey.withOpacity(0.3), // Set the splash color
        onTap: () {
          Navigator.pushNamed(
            context, 
            AppRoutes.productdetail,
            arguments: product,
          );
        },
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: CustomImage(imageUrl: product.images.first),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '\$${product.price}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
