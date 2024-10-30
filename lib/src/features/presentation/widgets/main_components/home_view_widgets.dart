import 'package:ecommerce_app/src/core/utils/contants.dart';
import 'package:ecommerce_app/src/features/presentation/blocs/electronics/electronics_products_bloc.dart';
import 'package:ecommerce_app/src/features/presentation/blocs/electronics/electronics_products_state.dart';
import 'package:ecommerce_app/src/features/presentation/blocs/product/product_bloc.dart';
import 'package:ecommerce_app/src/features/presentation/blocs/product/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/src/core/utils/app_colors.dart';
import 'package:ecommerce_app/src/features/data/models/product_model.dart';
import 'package:ecommerce_app/src/features/presentation/widgets/components/custom_button.dart';
import 'package:ecommerce_app/src/features/presentation/widgets/elements/custom_circle_indicator.dart';
import 'package:ecommerce_app/src/features/presentation/widgets/components/search_widget.dart';
import 'package:ecommerce_app/src/features/presentation/widgets/main_components/categories_row.dart';
import 'product_grid_view.dart';

class HomeViewWidgets extends StatelessWidget {
  const HomeViewWidgets({super.key, required this.products});
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const CustomCircleIndicator();
          
        } else if (state is ProductError) {
          return Center(child: Text(state.message));
        } else if (state is ProductLoaded) {
          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              _buildContent(state.products),
              ProductGridView(products: state.products), 
            
            ],
          );
        } else {
          return ErrorWidget('No Products');
        }
      },
    );
  }

  SliverList _buildContent(List<Product> products) {
    return SliverList(
      delegate: SliverChildListDelegate([
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
            borderRadius: BorderRadius.circular(20),
          ),
          width: 360,
          height: 55,
          child: const Text(
            'Delivery is 50% Cheaper',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CustomButton(elevation: 0, text: 'Show all', onPressed: () {}),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 200, // Height of the horizontal ListView
          child: ListView.builder(
            itemCount: 1,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return const CategoriesRow();
            },
          ),
        ),
        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Flash Sale',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
       
      ]),
    );
  }
}
