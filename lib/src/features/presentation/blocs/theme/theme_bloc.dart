import 'package:ecommerce_app/src/core/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  ThemeBloc() : super(AppTheme.lightTheme) {
    on<ToggleThemeEvent>((event, emit) {
      if (state.brightness == Brightness.dark) {
        emit(AppTheme.lightTheme);
      } else {
        emit(AppTheme.darkTheme);
      }
    });
  }
}
