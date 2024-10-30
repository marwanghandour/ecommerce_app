import 'package:ecommerce_app/src/core/utils/app_icons.dart';
import 'package:ecommerce_app/src/features/presentation/blocs/jewllery/jewllery_bloc.dart';
import 'package:ecommerce_app/src/features/presentation/blocs/jewllery/jewllery_state.dart';
import 'package:ecommerce_app/src/features/presentation/widgets/elements/custom_circle_indicator.dart';
import 'package:ecommerce_app/src/features/presentation/widgets/main_components/product_grid_view.dart';
import 'package:ecommerce_app/src/features/presentation/widgets/navigation/custom_sliver_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JewlleryView extends StatelessWidget {
  const JewlleryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JewlleryBloc, JewlleryState>(
      builder: (context, state) {
        if (state is JewlleryLoading) {
          return const CustomCircleIndicator();
        } else if (state is JewlleryError) {
          return ErrorWidget(state.message);
        } else if (state is JewlleryLoaded) {
          return Scaffold(
            body: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                CustomSliverAppBar(
                  expandedHeight: 0,
            title: "Jewllery",
            actions: [
              IconButton(
                icon: const Icon(AppIcons.search),
                onPressed: () {},
              ),
              ], isPinned: false,
              ),
                ProductGridView(products: state.jewllery), 
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
