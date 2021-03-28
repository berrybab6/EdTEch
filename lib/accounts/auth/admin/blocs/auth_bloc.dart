import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ed_tech/users/eventmodule/models/User.dart';
//import 'package:ed_tech/accounts/auth/admin/models/User.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
   if(event is AuthLoad){
     yield AuthLoading();
     await Future.delayed(Duration(seconds: 2));

   }
   if(event is AuthInitialize){
     yield AuthInitial();
   }
   if(event is LoggingIn){
     yield LoggingPage();
   }
   if(event is Login){
     yield LoggingInProcess();
     try{
      //R List<dynamic> result =

     }catch (e) {

     }
   }


  }
}
