import 'package:ecommerce_app/src/features/data/models/product_model.dart';
import 'package:ecommerce_app/src/features/presentation/views/clothing_view.dart';
import 'package:ecommerce_app/src/features/presentation/views/electronics_category_view.dart';
import 'package:ecommerce_app/src/features/presentation/views/error_view.dart';
import 'package:ecommerce_app/src/features/presentation/views/home_screen.dart';
import 'package:ecommerce_app/src/features/presentation/views/jewllery_view.dart';
import 'package:ecommerce_app/src/features/presentation/views/product_detail_view.dart';
import 'package:ecommerce_app/src/features/presentation/views/search_page.dart';
import 'package:ecommerce_app/src/features/presentation/views/splash_screen.dart';
import 'package:ecommerce_app/src/features/presentation/widgets/main_components/product_list.dart';
import 'package:flutter/material.dart';
import '../../core/utils/navigation_helper.dart';

class AppRoutes {
  static const String home = '/';
  static const String productList = '/product_list';
  static const String splash = '/splash';
  static const String electronics = '/electronics';
  static const String jewllery = '/jewllery';
  static const String clothing = '/clothing';
  static const String search = '/search';
  static const String productdetail = '/productdetail';





  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return NavigationHelper.createSlideRoute(const HomeScreen());
      case productList:
        return NavigationHelper.createSlideRoute( const ProductList());
      
      case splash:
        return NavigationHelper.createSlideRoute( const Splashscreen());
     case electronics: 
       return NavigationHelper.createSlideRoute( const ElectronicsCategoryView());

       case jewllery: 
       return NavigationHelper.createSlideRoute( const JewlleryView());

       case clothing:
       return NavigationHelper.createSlideRoute( const ClothingView());
 
       case search:
       return NavigationHelper.createSlideRoute( const SearchPage());

      case productdetail:
      final product = settings.arguments as Product;
       return NavigationHelper.createSlideRoute( ProductDetailView(product: product,));


      
      default:
        return NavigationHelper.createSlideRoute(const ErrorView());
    }
  }
}
