import 'package:ecommerce_app/src/features/presentation/views/error_view.dart';
import 'package:ecommerce_app/src/features/presentation/views/home_screen.dart';
import 'package:ecommerce_app/src/features/presentation/views/splash_screen.dart';
import 'package:ecommerce_app/src/features/presentation/widgets/main_components/product_list.dart';
import 'package:flutter/material.dart';

import '../../core/utils/navigation_helper.dart';

class AppRoutes {
  static const String home = '/';
  static const String productList = '/product_list';
  static const String splash = '/splash';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return NavigationHelper.createSlideRoute(const HomeScreen());
      case productList:
        return NavigationHelper.createSlideRoute( const ProductList());
      
      case splash:
        return NavigationHelper.createSlideRoute( const Splashscreen());
     
      
      default:
        return NavigationHelper.createSlideRoute( const ErrorView());
    }
  }
}
