import 'package:ed_tech/accounts/CreateAccount.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'accounts/contSignup.dart';

import 'users/eventmodule/views/createStudent.dart';
import 'users/eventmodule/views/createTeacher.dart';
import 'users/eventmodule/views/login.dart';
import 'users/eventmodule/views/users.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'EdTech',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      defaultTransition:Transition.zoom,
      getPages: [
        GetPage(name: '/', page:()=>Login() ),
        GetPage(name:'/users', page:()=>UserListView() ,
        transition: Transition.leftToRight),
        GetPage(name: '/register', page: ()=>CreateTeacher()),
        GetPage(name: '/registerS', page: ()=>CreateStudent()),
      ],
//      routes: {
//        // When navigating to the "/" route, build the FirstScreen widget.
//        '/': (context) => UserListView()/*LoginUser()Login()*/,
//        // When navigating to the "/second" route, build the SecondScreen widget.
//        '/signup': (context) => CreateAccount(),
//        '/next':(context) => Next(),
//      },
      theme: ThemeData(

        primarySwatch: Colors.orange,
      ),
//      home: Login(),//CreateAccount(),
    );
  }


  Route onGenerate(){

  }
}
