import 'package:ecommerce_app/src/core/utils/app_icons.dart';
import 'package:ecommerce_app/src/features/presentation/blocs/electronics/electronics_products_bloc.dart';
import 'package:ecommerce_app/src/features/presentation/blocs/electronics/electronics_products_state.dart';
import 'package:ecommerce_app/src/features/presentation/widgets/elements/custom_circle_indicator.dart';
import 'package:ecommerce_app/src/features/presentation/widgets/main_components/product_grid_view.dart';
import 'package:ecommerce_app/src/features/presentation/widgets/navigation/custom_sliver_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ElectronicsCategoryView extends StatelessWidget {
  const ElectronicsCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ElectronicsProductsBloc, ElectronicsState>(
      builder: (context, state) {
        if (state is ElectronicsLoading) {
          return const CustomCircleIndicator();
        } else if (state is ElectronicsError) {
          return ErrorWidget(state.message);
        } else if (state is ElectronicsLoaded) {
          return Scaffold(
            
            body: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                CustomSliverAppBar(
                  Ispinned: false,
                  expandedHeight: 0,
            title: "Electronics",
            actions: [
              IconButton(
                icon: const Icon(AppIcons.search),
                onPressed: () {},
              ),
              ],
              ),
                ProductGridView(products: state.electronics), 
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
