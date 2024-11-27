import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class SplashscreenState {
  final double opacity;

  SplashscreenState(this.opacity);
}

class SplashscreenCubit extends Cubit<SplashscreenState> {
  late AnimationController animationController;

  SplashscreenCubit() : super(SplashscreenState(1.0));

  void startAnimation(TickerProvider vsync) {
    animationController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: vsync,
    )..forward();

    animationController.addListener(() {
      emit(SplashscreenState(1.0 - animationController.value));
    });

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        emit(SplashscreenState(0.0));
      }
    });
  }

  void dispose() {
    animationController.dispose();
  }
}
