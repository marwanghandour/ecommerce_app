import 'package:ecommerce_app/src/core/utils/app_colors.dart';
import 'package:ecommerce_app/src/features/data/models/product_model.dart';
import 'package:ecommerce_app/src/features/presentation/widgets/components/custom_button.dart';
import 'package:ecommerce_app/src/features/presentation/widgets/elements/search_widget.dart';
import 'package:ecommerce_app/src/features/presentation/widgets/main_components/categories_row.dart';
import 'package:flutter/material.dart';

class HomeViewWidgets extends StatelessWidget {
  const HomeViewWidgets({super.key, required this.products});
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        _buildContent(),

      ],
    );

  
  }
  SliverToBoxAdapter _buildContent(){
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: SearchWidget(),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10, left: 20),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
           color: AppColors.primaryDark,
           shape: BoxShape.rectangle,
           borderRadius: BorderRadius.circular(20)
            ),
            width: 360,
            height: 55,
            child: const Text('Delivery is 50% Cheaper',style:  TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20,),

           Padding(
            padding: const EdgeInsets.all(16.0),
            child:  Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Categories', style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),),
                    CustomButton(
                      elevation: 0,
                      text: 'Show all',
                       onPressed: (){}
                       ),
                  ],
                ),
                CategoriesRow(),

              ],
            ),
          ),
        
        ],
      ),
    
    
   );
   
  }
}