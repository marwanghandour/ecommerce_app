import 'package:ecommerce_app/src/core/utils/app_colors.dart';
import 'package:ecommerce_app/src/core/utils/app_icons.dart';
import 'package:ecommerce_app/src/features/home/presentation/widgets/components/custom_button.dart';
import 'package:ecommerce_app/src/features/home/presentation/widgets/components/icon_container.dart';
import 'package:ecommerce_app/src/features/home/presentation/widgets/navigation/custom_sliver_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/src/features/home/data/models/product_model.dart';

class ProductDetailView extends StatelessWidget {
  final Product product;

  const ProductDetailView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconContainer(icon: const Icon(AppIcons.xsign, color: Colors.black,),
              onPressed: (){
                Navigator.pop(context);
              },
              ),
            ),
            backgroundImage: product.images.first,
            expandedHeight: 600.0, 
            actions: const [
              IconContainer(icon: Icon(Icons.favorite_border, color: Colors.black,)),
              SizedBox(width: 10,),
               IconContainer(icon: Icon(AppIcons.cart, )),

              SizedBox(width: 5,),
            ],isPinned: false,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '\$${product.price}',
                      style: const TextStyle(fontSize: 20, color: Colors.green),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      product.description,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: CustomButton(
                        color: AppColors.primaryLight,
                        text: 'Add To Cart',
                         onPressed: (){},
                         padding: const EdgeInsets.symmetric(horizontal: 130, vertical: 15),
                         ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
