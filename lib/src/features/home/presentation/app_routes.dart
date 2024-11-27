import 'package:ecommerce_app/src/features/auth/presentation/views/auth/sign_in_view.dart';
import 'package:ecommerce_app/src/features/auth/presentation/views/auth/sign_up_page.dart';
import 'package:ecommerce_app/src/features/home/data/models/product_model.dart';
import 'package:ecommerce_app/src/features/home/presentation/views/clothing_view.dart';
import 'package:ecommerce_app/src/features/home/presentation/views/electronics_category_view.dart';
import 'package:ecommerce_app/src/features/home/presentation/views/error_view.dart';
import 'package:ecommerce_app/src/features/home/presentation/views/home_screen.dart';
import 'package:ecommerce_app/src/features/home/presentation/views/jewllery_view.dart';
import 'package:ecommerce_app/src/features/home/presentation/views/on_boarding/onboarding_view.dart';
import 'package:ecommerce_app/src/features/home/presentation/views/product_detail_view.dart';
import 'package:ecommerce_app/src/features/home/presentation/views/search_page.dart';
import 'package:ecommerce_app/src/features/home/presentation/views/splash_screen.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/navigation_helper.dart';

class AppRoutes {
  static const String home = '/';
  static const String splash = '/splash';
  static const String electronics = '/electronics';
  static const String jewllery = '/jewllery';
  static const String clothing = '/clothing';
  static const String search = '/search';
  static const String productdetail = '/productdetail';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signup = '/signup';








  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return NavigationHelper.createSlideRoute(const HomeScreen());
     
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

       case onboarding:
       return NavigationHelper.createSlideRoute(OnboardingView());

       case login:
       return NavigationHelper.createSlideRoute(const SignInPage());

       case signup:
       return NavigationHelper.createSlideRoute(const SignUpPage());






      
      default:
        return NavigationHelper.createSlideRoute(const ErrorView());
    }
  }
}
