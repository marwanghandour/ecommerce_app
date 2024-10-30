import 'package:ecommerce_app/src/core/utils/app_icons.dart';
import 'package:ecommerce_app/src/features/presentation/blocs/clothing/clothing_bloc.dart';
import 'package:ecommerce_app/src/features/presentation/blocs/clothing/clothing_state.dart';
import 'package:ecommerce_app/src/features/presentation/widgets/elements/custom_circle_indicator.dart';
import 'package:ecommerce_app/src/features/presentation/widgets/main_components/product_grid_view.dart';
import 'package:ecommerce_app/src/features/presentation/widgets/navigation/custom_sliver_app_bar.dart';
import 'package:ecommerce_app/src/features/presentation/widgets/navigation/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClothingView extends StatelessWidget {
  const ClothingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClothingBloc, ClothingState>(
      builder: (context, state) {
        if (state is ClothingLoading) {
          return const CustomCircleIndicator();
        } else if (state is ClothingError) {
          return ErrorWidget(state.message);
        } else if (state is ClothingLoaded) {
          return  Scaffold(
            body: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                CustomSliverAppBar(
                  Ispinned: false,
                  expandedHeight: 0,
            title: "Clothing",
            actions: [
              IconButton(
                icon: const Icon(AppIcons.search),
                onPressed: () {},
              ),
              ],
              ),
            
                ProductGridView(products: state.clothing), 
                
              ],
        
          ),
            );
        } else {
          return ErrorWidget('No Products');
        }
      },
    );
  }
  }
