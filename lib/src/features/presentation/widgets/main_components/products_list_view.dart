import 'package:ecommerce_app/src/features/presentation/widgets/components/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/src/features/data/models/product_model.dart';

class ProductListView extends StatelessWidget {
  final List<Product> products;

  const ProductListView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            leading: CustomImage(imageUrl: product.image),
            title: Text(product.title),
            subtitle: Text('\$${product.price}'),
          );
        },
      ),
    );
  }
}
