import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/sources/supabase_auth_sources.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, MyAuthState> {
  final SupabaseAuthSource authSource;

  AuthBloc(this.authSource) : super(AuthInitialState()) {
    on<SignInEvent>(_onSignIn);
    on<SignUpEvent>(_onSignUp);
    on<SignOutEvent>(_onSignOut);
  }

  Future<void> _onSignIn(SignInEvent event, Emitter<MyAuthState> emit) async {
    emit(AuthLoadingState());
    try {
      final email = await authSource.signIn(event.email, event.password);
      emit(AuthSuccessState(email: email));
    } catch (e) {
      final errorMessage = _getCustomErrorMessage(e.toString());
      emit(AuthFailureState(message: errorMessage));
    }
  }

  Future<void> _onSignUp(SignUpEvent event, Emitter<MyAuthState> emit) async {
    emit(AuthLoadingState());
    try {
      final email = await authSource.signUp(event.email, event.password);
      emit(AuthSuccessState(email: email));
    } catch (e) {
      final errorMessage = _getCustomErrorMessage(e.toString());
      emit(AuthFailureState(message: errorMessage));
    }
  }

  Future<void> _onSignOut(SignOutEvent event, Emitter<MyAuthState> emit) async {
    emit(AuthLoadingState());
    try {
      await authSource.signOut();
      emit(AuthInitialState());
    } catch (e) {
      final errorMessage = _getCustomErrorMessage(e.toString());
      emit(AuthFailureState(message: errorMessage));
    }
  }

  String _getCustomErrorMessage(String error) {
  if (error.contains('email') && error.contains('invalid')) {
    return 'The email address provided is invalid. Please check and enter a valid email address.';
  } else if (error.contains('email') && error.contains('not found')) {
    return 'No account found with this email. Please check and try again.';
  } else if (error.contains('password') && error.contains('incorrect')) {
    return 'The password you entered is incorrect. Please try again.';
  } else if (error.contains('password') && error.contains('weak')) {
    return 'The password is too weak. Please choose a stronger password.';
  } else if (error.contains('network')) {
    return 'Network issue detected. Please check your internet connection or try again later.';
  } else if (error.contains('timeout')) {
    return 'The request timed out. Please check your connection and try again.';
  } else if (error.contains('user') && error.contains('disabled')) {
    return 'Your account has been disabled. Please contact support for assistance.';
  } else if (error.contains('account') && error.contains('locked')) {
    return 'Your account has been locked due to multiple failed attempts. Please try again later.';
  } else if (error.contains('email') && error.contains('already exists')) {
    return 'An account with this email already exists. Please try logging in or use a different email.';
  } else if (error.contains('server')) {
    return 'Server issue. Please try again later.';
  } else if (error.contains('unauthorized')) {
    return 'Unauthorized access. Please check your credentials and try again.';
  } else if (error.contains('quota')) {
    return 'Quota exceeded. Please try again after some time.';
  } else if (error.contains('unexpected')) {
    return 'An unexpected error occurred. Please try again later.';
  } else {
    return 'An unknown error occurred. Please try again or contact support if the issue persists.';
  }
}
}
