import 'package:ecommerce_app/src/features/presentation/views/error_view.dart';
import 'package:ecommerce_app/src/features/presentation/widgets/elements/custom_circle_indicator.dart';
import 'package:ecommerce_app/src/features/presentation/widgets/elements/error_widget.dart';
import 'package:ecommerce_app/src/features/presentation/widgets/main_components/products_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/product/product_bloc.dart';
import '../../blocs/product/product_state.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const CustomCircleIndicator();
        } else if (state is ProductLoaded) {
          return ProductListView(products: state.products);
        } else if (state is ProductError) {
          return CustomErrorWidget(errMessege: state.message);
        } else {
          return const ErrorView();
        }
      },
    );
  }
}
