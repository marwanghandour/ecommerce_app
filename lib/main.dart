import 'package:dio/dio.dart';
import 'package:ecommerce_app/src/features/data/repositories/product_repo.dart';
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
