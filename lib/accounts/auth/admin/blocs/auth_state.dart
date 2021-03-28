part of 'auth_bloc.dart';

//import '../../../User.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

///Loading User progress
class AuthLoading extends AuthState{}

///Login Successs
class Authenticated extends AuthState{
  final User user;

  Authenticated([this.user]);

  @override
  List<Object> get props => [user];

}

///While loading User
class AuthFailure extends AuthState{
  final String message;

  AuthFailure([this.message]);
  @override
  List<Object> get props => [message];

}
//class TheLoading extends AuthState{}
///refreshed Loggingpage
class LoggingPage extends AuthState{}


///loggingInProcess Processing recieved event
class LoggingInProcess extends AuthState{}

//class AuthLoginSuccess extends AuthState{
//}

class LoginFailed extends AuthState{
  final String message;

  LoginFailed({this.message});
  @override
  List<Object> get props => [message];
}
