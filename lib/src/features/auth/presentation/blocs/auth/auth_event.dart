import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;

  const SignInEvent(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}

class SignUpEvent extends AuthEvent {
  final String email;
  final String password;

  const SignUpEvent(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
  
}
class SignOutEvent extends AuthEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}


