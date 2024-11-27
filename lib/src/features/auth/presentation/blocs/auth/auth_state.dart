import 'package:equatable/equatable.dart';

abstract class MyAuthState extends Equatable {
  const MyAuthState();
}

class AuthInitialState extends MyAuthState {
  @override
  List<Object> get props => [];
}

class AuthLoadingState extends MyAuthState {
  @override
  List<Object> get props => [];
}

class AuthFailureState extends MyAuthState {
  final String message;

  const AuthFailureState({required this.message});

  @override
  List<Object> get props => [message];
}

class AuthSuccessState extends MyAuthState {
  final String email;

  const AuthSuccessState({required this.email});

  @override
  List<Object> get props => [email];
}
