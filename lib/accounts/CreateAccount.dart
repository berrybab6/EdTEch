import 'dart:convert';

//import 'package:ed_tech/accounts/User.dart';
//import 'package:ed_tech/accounts/auth/admin/models/User.dart';
import 'package:ed_tech/users/eventmodule/models/User.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'contSignup.dart';


Future<User> userLogin(String email, String password, String fullName, String username) async {
  final _baseUrl = '10.5.240.120:8000';
  final http.Client httpClient=http.Client();

  final _base = "https://10.5.240.120:8000";
  final _tokenEndpoint = "/api-token-auth/";
  final _tokenURL = _base + _tokenEndpoint;

  final response = await httpClient.post(
    Uri.http('$_baseUrl','users/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },

    body: jsonEncode(<String, dynamic>{

      'email': email,
      'password': password,
      'full_name':fullName,
      'username':username,
      'student': true
    },
    ),
  );

//  final response = await http.post(
//    Uri.http('$_baseUrl', 'users/login/'),
//    headers: <String, String>{
//      'Content-Type': 'application/json; charset=UTF-8',
//    },
//    body: jsonEncode(<String, String>{
//      'email': email,
//      'password': password
//    }),
//  );


  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return User.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to load user');
  }
}


class CreateAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
//        '/': (context) => Login(),
        // When navigating to the "/second" route, build the SecondScreen widget.
//        '/signup': (context) => CreateAccount(),
        '/next':(context) => Next(),
      },
      home: Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child:Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30.0, bottom: 30.0),
                  alignment: Alignment.center,
                  child:Center(
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                        color:Colors.deepOrangeAccent,
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  )
                ),
                SizedBox(height: 20.0,),

                SignupForm(),
              ],
            )
          ),
        ),
      ),
    );
  }
}


class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}


String dropdownValue ="Select your role";
List<String> spinnerItems = [
  'Select your role',
  'Teacher',
  'Student'
] ;


class _SignupFormState extends State<SignupForm> {

  Future<User> _userLogin;
  TextEditingController userNameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController passwordConfirmController = new TextEditingController();
  TextEditingController fullNameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        child:(_userLogin == null)? Column(
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: TextFormField(
                autofocus: false,
//                              validator: (val) => val.isEmpty ? 'Empty Field' : null,
                controller: fullNameController,
                keyboardType: TextInputType.name,
                style: TextStyle(fontSize: 20.0, color: Colors.black, letterSpacing: 1.0,),
//                              onChanged: (val){
//
//                              },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
                  hintText: 'Enter your FullName',
                  labelText: "FullName",
                  hintStyle: TextStyle(fontSize: 16.0, color: Colors.grey[900],),
                  filled: true,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  fillColor: Colors.grey[200],
                  suffixIcon: IconButton(icon: Icon(Icons.person_outline),),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.transparent, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.transparent, width: 2.0),
                    gapPadding: 10.0,
                  ),
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: TextFormField(
                autofocus: false,
//                              validator: (val) => val.isEmpty ? 'Empty Field' : null,
                controller: userNameController,
                keyboardType: TextInputType.name,
                style: TextStyle(fontSize: 20.0, color: Colors.black, letterSpacing: 1.0,),
//                              onChanged: (val){
//
//                              },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
                  hintText: 'Enter your UserName',
                  labelText: "Username",
                  hintStyle: TextStyle(fontSize: 16.0, color: Colors.grey[900],),
                  filled: true,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  fillColor: Colors.grey[200],
                  suffixIcon: IconButton(icon: Icon(Icons.person_outline),),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.transparent, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.transparent, width: 2.0),
                    gapPadding: 10.0,
                  ),
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: TextFormField(
                autofocus: false,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(fontSize: 20.0, color: Colors.black, letterSpacing: 1.0,),
//                              onChanged: (val){
//
//                              },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
                  hintText: 'Enter Your Email',
                  labelText: "Email",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon: IconButton(icon: Icon(Icons.mail_outline),),
                  hintStyle: TextStyle(fontSize: 16.0, color: Colors.grey[900],),
                  filled: true,
                  fillColor: Colors.grey[200],
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.transparent, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.transparent, width: 2.0),
                    gapPadding: 10.0,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: TextFormField(


                autofocus: false,
//                        validator: (val) => val.isEmpty ? 'Empty Field' : null,

                controller: passwordController,
                keyboardType: TextInputType.text,
                obscureText: true,
                style: TextStyle(fontSize: 20.0, color: Colors.black, letterSpacing: 1.0,),
//                        onChanged: (val){
//
//                        },
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
                  hintText: 'Enter Password',
                  labelText: "password",
                  suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.visibility)),
                  hintStyle: TextStyle(fontSize: 16.0, color: Colors.grey[900],),
                  filled: true,
                  fillColor: Colors.grey[200],
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.transparent, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.transparent, width: 2.0),
                    gapPadding: 10.0,
                  ),
                ),

              ),
            ),

/*

            Column(
//                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 20.0),
                    child: Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 30.0,top: 20.0),
                      child: Text("Role",
                        style: TextStyle(
                          fontSize: 26.0,
                          color: Colors.black,
                        ),),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(4.0),
                    margin: EdgeInsets.symmetric(horizontal: 40.0),
                    color: Colors.grey[200],
                    child: Center(
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(color: Colors.black, fontSize: 24),
                        underline: Container(
                          height: 0.3,
                          color: Colors.grey,
                        ),
                        onChanged: (String data) {
                          setState(() {
                            dropdownValue = data;
                          });
                        },
                        items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value??""),
                          );
                        }).toList(),
                      ),
                    ),
                  ),

//            Text('Selected Item = ' + '$dropdownValue' ?? '',
//                style: TextStyle
//                  (fontSize: 22,
//                    color: Colors.black)),
                ]),

*/


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                    onTap: (){
                      Navigator.of(context).pushNamed('/next');
                    },

                    child:Container(
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.only(left: 20.0),
                      height: 70,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
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
                              Colors.orange[900],
                              Colors.orange[500],
                            ],
                          )),
                      child: Center(
                        child: Text(
                          'Next',
                          style: TextStyle(
                              fontSize: 27.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    )),
//                SizedBox(
//                  width:20.0,
//                ),

                GestureDetector(
                    onTap: (){
                      setState(() {
                        _userLogin = userLogin(emailController.text, passwordController.text, fullNameController.text, userNameController.text);

                      });
                    },

                    child:Container(
                      height: 70,
                      margin: EdgeInsets.only(right: 20.0),
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
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
                              Colors.orange[900],
                              Colors.orange[500],
                            ],
                          )),
                      child: Center(
                        child: Text(
                          'Finish',
                          style: TextStyle(
                              fontSize: 27.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ))
              ],
            )

          ],
        ) :
    FutureBuilder<User>(
    future: _userLogin,
    builder: (context, snapshot) {
    if (snapshot.hasData) {
    // ignore: unrelated_type_equality_checks
    return (snapshot.data.full_name != null )?ListTile(
      title:Text(snapshot.data.full_name.toString()) ,
      leading: Text(snapshot.data.email.toString()),
      subtitle: Text(snapshot.data.username.toString()),
    ):Text("NOT A User");
//      Text(snapshot.data.email == true?snapshot.data.email.toString():"not a student ");
    } else if (snapshot.hasError) {
    return Text("${snapshot.error}");
    }

    return CircularProgressIndicator();
    },
    ))
    ;
  }
}

