part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class Loading extends AuthEvent{
  @override
  List<Object> get props => [];
}

class AuthInitialize extends AuthEvent{
  @override
  List<Object> get props => [];

}


class Login extends AuthEvent{
  final String email;
  final String password;

  Login({this.email, this.password});
  @override
  List<Object> get props => [email, password];
}


class LoggingIn extends AuthEvent{
  @override
  List<Object> get props => [];
}

class AuthLoad extends AuthEvent{
  @override
  List<Object> get props => [];
}