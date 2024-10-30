import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../app_routes.dart';
import '../blocs/splash_screen_bloc.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> with SingleTickerProviderStateMixin {
  late SplashscreenCubit _splashscreenCubit;

  @override
  void initState() {
    super.initState();
    _splashscreenCubit = SplashscreenCubit();
    _splashscreenCubit.startAnimation(this);

    _splashscreenCubit.stream.listen((state) {
      if (state.opacity == 0.0) {
  Navigator.pushNamedAndRemoveUntil(
  // ignore: use_build_context_synchronously
  context,
  AppRoutes.home,
  (Route<dynamic> route) => false,
);

      }
    });
  }

  @override
  void dispose() {
    _splashscreenCubit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _splashscreenCubit,
      child: BlocBuilder<SplashscreenCubit, SplashscreenState>(
        builder: (context, state) {
          return Scaffold(
            body: Opacity(
              opacity: state.opacity,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Center(
                        child: Image.asset(
                          'assets/images/logo_gif.gif',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Developed by Marwan',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
