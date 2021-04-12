import 'package:ed_tech/accounts/CreateAccount.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'accounts/contSignup.dart';

import 'users/eventmodule/controller/LoginController.dart';
import 'users/eventmodule/views/UserHome.dart';
import 'users/eventmodule/views/Users/ResourcePage.dart';
import 'users/eventmodule/views/Users/home.dart';
import 'users/eventmodule/views/add_update.dart';
import 'users/eventmodule/views/admin/adminhome.dart';
import 'users/eventmodule/views/changePassword.dart';
import 'users/eventmodule/views/commonView/ImageP.dart';
import 'users/eventmodule/views/commonView/onBoard.dart';
import 'users/eventmodule/views/commonView/userprofile.dart';
import 'users/eventmodule/views/createStudent.dart';
import 'users/eventmodule/views/createTeacher.dart';
import 'users/eventmodule/views/login.dart';
import 'users/eventmodule/views/users.dart';

void main() async{
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  LoginController _loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'EdTech',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      defaultTransition:Transition.zoom,
      getPages: [
        GetPage(name: '/myAccounts', page: ()=>UserProfile()),
        GetPage(name: '/edit', page:()=> ImageUploadPages()),
//        GetPage(name:'/', page: ()=>OnBoard()),
        GetPage(name:'/', page: ()=> ResourcePage()),
        GetPage(name: '/login', page:()=>Login() ),
        GetPage(name: '/admin',page: ()=>AdminHome()),
        GetPage(name:'/users', page:()=>UserListView() ,
        transition: Transition.leftToRight),
        GetPage(name: '/changePassword', page:()=>ChangePassword()),
        GetPage(name: '/home', page: ()=>Home()),
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

