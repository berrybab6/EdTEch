import 'dart:convert';

//import 'package:ed_tech/accounts/CreateAccount.dart';
import 'package:ed_tech/accounts/UserArgument.dart';
import 'package:ed_tech/accounts/UserData.dart';
import 'package:ed_tech/accounts/admin/adminpage.dart';
import 'package:ed_tech/resources/resources_module/views/ResourcePage.dart';
import 'package:ed_tech/users/eventmodule/controller/LoginController.dart';
import 'package:ed_tech/users/eventmodule/models/User.dart';
import 'package:ed_tech/users/eventmodule/views/admin/adminhome.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

//import 'CreateAccount.dart';
//import 'auth/admin/models/User.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin{
  double _scale;
  AnimationController _controller;
  var userData = GetStorage();
  final LoginController loginController = Get.put(LoginController());

  final _formKey = GlobalKey<FormState>();



//  UserDataProvider userDataProvider = new UserDataProvider();
//  Future<User> _userLogin ;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 500,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final UserArgument args = ModalRoute.of(context).settings.arguments;
    _scale = 1 - _controller.value;

    if(userData.read('isLoggedIn')) {
      if (userData.read('user') == 1) {
        return AdminHome();
      } else if (userData.read('user') == 2 || userData.read('user') == 3) {
        return ResourcePage();
      }
    }else{
    return  (userData.read("isLoggedIn"))? (userData.read("user")==1)?AdminPage():ResourcePage():Scaffold(

        body: Container(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(

                padding: const EdgeInsets.only(top: 20.0),

                child: GestureDetector(
                  onTap: (){
                    Get.toNamed('/registerS');
                  },
                  child: ClipRRect(

                    borderRadius: BorderRadius.circular(20.0),

                    child: Image(

                      image: AssetImage("assets/images/edtech3.jpg"),
                      fit: BoxFit.fitWidth
                      ,
                    ),
                  ),
                ),
              ),
              SizedBox(height:10,),
              TextFormField(
                controller: loginController.emailLController,
                keyboardType: TextInputType.emailAddress,
//                initialValue: "mish@gmail.com",
                autofocus: false,
                decoration: InputDecoration(
                  hintText: "Email",
                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0)
                  )
                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: loginController.passwordLController,
                keyboardType: TextInputType.text,
                obscureText: true,
//                initialValue: "",
                autofocus: false,
                decoration: InputDecoration(
                    hintText: "Password",
                    contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)
                    )
                ),
              ),
              SizedBox(height:30.0,),
              Center(
                child: GestureDetector(
                  onTapDown: _tapDown,
                  onTapUp: _tapUp,
                  onTap: () async{
                    loginController.apiLogin();

//                    print(loginController.userLogin());
//                    print("Login Succesfull");
//                    if(loginController.isLoading.value==false){
//                      loginController.userLogin();
//                      print("logged in User: ${loginController.email.value}");
//                    }else{
//                      return Center(child: CircularProgressIndicator(),);
//                    }


//                    setState(() {
//
//                      _userLogin = userLogin(emailController.text, passwordController.text);
//
//                    });
                  },
                  child: Transform.scale(
                    scale: _scale,
                    child: _animatedButton(),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("I don't have account", style: TextStyle(fontSize: 16.0, color: Colors.grey[800], fontWeight: FontWeight.w400, letterSpacing: 1.0),),
                    SizedBox(width: 5.0,),
                    TextButton(
                      child: Text('SignUp', style: TextStyle(fontSize: 16.0, color: Colors.deepOrange, fontWeight: FontWeight.w400, letterSpacing: 1.0),),
                      onPressed: (){
                        Get.toNamed('/register');
//                        BlocProvider.of<AuthBloc>(context, listen: false).add(AuthInitialize());
                      },
                    ),
                  ],
                ),
              ),

            ],
          ),));
    }
    }


//          FutureBuilder<User>(
//            future: _userLogin,
//            builder: (context, snapshot) {
//              if (snapshot.hasData) {
//                return  (snapshot.data.full_name != null )?ListTile(
//                  title:Text(snapshot.data.full_name.toString()) ,
//                  leading: Text(snapshot.data.email.toString()),
//                  subtitle: Text(snapshot.data.username.toString()),
//                ):Text("NUll Value Returned");
//                 return  Center(child: Text(snapshot.data.admin!= false?snapshot.data.admin.toString():"not a student "));
//              } else if (snapshot.hasError) {
//                return Text("${snapshot.error}");
//              }

//              return CircularProgressIndicator();
//            },
//          )
//        ),
//      ),
//    );



  Widget  _animatedButton() {
    return Container(
      height: 70,
      width: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          boxShadow: [
            BoxShadow(
              color: Color(0x80000000),
              blurRadius: 12.0,
              offset: Offset(0.0, 5.0),
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.deepOrangeAccent,
              Colors.deepOrangeAccent,
            ],
          )),
      child: Center(
        child: Text(
          'Login',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
    );
  }

  void _tapDown(TapDownDetails details) {
    _controller.forward();
  }
  void _tapUp(TapUpDetails details) {
    _controller.reverse();
  }
}
