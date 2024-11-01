import 'package:dio/dio.dart';
import 'package:ecommerce_app/src/features/data/repositories/product_repo.dart';
import 'package:ecommerce_app/src/features/presentation/blocs/clothing/clothing_bloc.dart';
import 'package:ecommerce_app/src/features/presentation/blocs/clothing/clothing_event.dart';
import 'package:ecommerce_app/src/features/presentation/blocs/electronics/electronics_products_bloc.dart';
import 'package:ecommerce_app/src/features/presentation/blocs/electronics/electronics_products_event.dart';
import 'package:ecommerce_app/src/features/presentation/blocs/jewllery/jewllery_bloc.dart';
import 'package:ecommerce_app/src/features/presentation/blocs/jewllery/jewllery_event.dart';
import 'package:ecommerce_app/src/features/presentation/blocs/onboarding/onboarding_bloc.dart';
import 'package:ecommerce_app/src/features/presentation/blocs/product/product_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'src/features/presentation/app_routes.dart';
import 'src/features/presentation/blocs/product/product_bloc.dart';
import 'src/features/presentation/blocs/theme/theme_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider<ProductBloc>(
          create: (context) => ProductBloc(ProductRepository(Dio()))..add(FetchProducts()),
        lazy: true,
        ),

         BlocProvider<ElectronicsProductsBloc>(
          create: (context) => ElectronicsProductsBloc(ProductRepository(Dio()))..add(FetchElectronics()),
       lazy: true,
        ),

        BlocProvider<JewlleryBloc>(
          create: (context) => JewlleryBloc(ProductRepository(Dio()))..add(FetchJewllery()),
       lazy: true,
        ),

        BlocProvider<ClothingBloc>(
          create: (context) => ClothingBloc(ProductRepository(Dio()))..add(FetchClothing()),
       lazy: true, ),
        
        BlocProvider(create: (context)=> OnboardingBloc(),
        lazy: true,
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeData>(
        builder: (context, theme) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme,
            initialRoute: AppRoutes.splash,
            onGenerateRoute: (settings) => AppRoutes.generateRoute(settings),
          );
        },
      ),
    );
  }
}
