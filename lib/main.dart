import 'package:dio/dio.dart';
import 'package:ecommerce_app/src/features/home/data/repositories/product_repo.dart';
import 'package:ecommerce_app/src/features/home/presentation/blocs/clothing/clothing_bloc.dart';
import 'package:ecommerce_app/src/features/home/presentation/blocs/clothing/clothing_event.dart';
import 'package:ecommerce_app/src/features/home/presentation/blocs/electronics/electronics_products_bloc.dart';
import 'package:ecommerce_app/src/features/home/presentation/blocs/electronics/electronics_products_event.dart';
import 'package:ecommerce_app/src/features/home/presentation/blocs/jewllery/jewllery_bloc.dart';
import 'package:ecommerce_app/src/features/home/presentation/blocs/jewllery/jewllery_event.dart';
import 'package:ecommerce_app/src/features/home/presentation/blocs/onboarding/onboarding_bloc.dart';
import 'package:ecommerce_app/src/features/home/presentation/blocs/product/product_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'src/features/auth/data/sources/supabase_auth_sources.dart';
import 'src/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'src/features/home/presentation/app_routes.dart';
import 'src/features/home/presentation/blocs/product/product_bloc.dart';
import 'src/features/home/presentation/blocs/theme/theme_bloc.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imhpcmh3a3JkZ2Nucmpvc3lwZmpnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzIyNzIxNjEsImV4cCI6MjA0Nzg0ODE2MX0.6JaylnrYPcnMUB8fk8qkX_1P1QV4fSVmJSR8O4hMZL0', 
    url: 'https://hirhwkrdgcnrjosypfjg.supabase.co',
    );
    final supabaseClient = Supabase.instance.client;
     final authSource = SupabaseAuthSource(supabaseClient); 
     runApp(MyApp(authSource)); 
     } 
     class MyApp extends StatelessWidget 
     { 
      final SupabaseAuthSource authSource;
       const MyApp(this.authSource, {super.key});
       
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
             create: (context) => AuthBloc(authSource),
        ),
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
