import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {


  TextEditingController userNameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController passwordConfirmController = new TextEditingController();


  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  String dropdownValue ="Select your role";
  List<String> spinnerItems = [
    'Select your role',
    'Teacher',
    'Student'
  ] ;

  String departmentSelection = "Select your department";


  List<String> departmentSpinner = [
    'Select your department',
    'Software',
    'Electrical',
    'Mechanical',
    'IT',
    'Biomed',
    'Chemical',
    'Civil'
  ] ;

  String genderSelection = 'select ur gender';
  List<String> genderSpinner = [
    'select ur gender',
    'Female',
    'Male'
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scaffoldKey,
        body: Stack(

          children:[
                Form(
                  key: _formKey,
//                  autovalidate: _autoValidate,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.black,

                  child: SafeArea(
                    child: Container(
                      color: Colors.deepOrange[400],
                      child: ListView(
                        children: [



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
                                labelText: "Username",
                                contentPadding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
                                hintText: 'Enter your Username',
                                hintStyle: TextStyle(fontSize: 16.0, color: Colors.grey[900],),
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: Colors.transparent, width: 2.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: Colors.transparent, width: 2.0),
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
                                hintText: 'Email',
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
                          contentPadding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
                          hintText: 'Password',
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
                          ),
                        ),

                      ),
                    ),



                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                            child: TextFormField(
                              autofocus: false,
//                        validator: (val) => val.isEmpty ? 'Empty Field' : null,
                              controller: passwordConfirmController,
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              style: TextStyle(fontSize: 20.0, color: Colors.black, letterSpacing: 1.0,),
//                        onChanged: (val){
//
//                        },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
                                hintText: 'Confirm Password',
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
                                ),
                              ),

                            ),
                          ),

                         Padding(
                           padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                           child:Row(
                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                               children: <Widget>[

                                 Padding(
                                   padding: const EdgeInsets.only(left: 0, right: 0.0),
                                   child: Container(
                                     padding: EdgeInsets.all(20.0),
//                                     color: Colors.white,
                                     decoration: BoxDecoration(
                                       color: Colors.white,
                                       borderRadius: BorderRadius.circular(10.0)
                                     ),
                                     child: Text("Department",
                                     style: TextStyle(
                                       fontSize: 24.0,
                                       color: Colors.black
                                     ),),
                                   ),
                                 ),
                                 SafeArea(
                                   child: Container(
                                     color: Colors.grey[200],
                                     margin: EdgeInsets.symmetric(horizontal: 10),
                                     alignment: Alignment.center,
                                     child: DropdownButton<String>(
                                       value: departmentSelection,
                                       icon: Icon(Icons.arrow_drop_down),
                                       iconSize: 24,
                                       elevation: 10,

                                       style: TextStyle(
                                           color: Colors.black,

                                           fontSize: 22),
//                                       underline: Container(
//                                         height: 2,
//                                         color: Colors.black,
//                                       ),
                                       onChanged: (String data) {
                                         setState(() {
                                           departmentSelection = data;
                                         });
                                       },
                                       items: departmentSpinner.map<DropdownMenuItem<String>>((String value) {
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
                         )

                        ],
                      ),
                    ),
                  ),
                ),
                ),


//
//
//          Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: [
//              Row(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    Padding(
//                      padding: const EdgeInsets.only(left: 30, right: 20.0),
//                      child: Container(
//                        child: Text("Gender"),
//                      ),
//                    ),
//                    DropdownButton<String>(
//                      value: genderSelection,
//                      icon: Icon(Icons.arrow_drop_down),
//                      iconSize: 24,
//                      elevation: 16,
//                      style: TextStyle(color: Colors.red, fontSize: 18),
//                      underline: Container(
//                        height: 2,
//                        color: Colors.deepPurpleAccent,
//                      ),
//                      onChanged: (String data) {
//                        setState(() {
//                          genderSelection = data;
//                        });
//                      },
//                      items: genderSpinner.map<DropdownMenuItem<String>>((String value) {
//                        return DropdownMenuItem<String>(
//                          value: value,
//                          child: Text(value??""),
//                        );
//                      }).toList(),
//                    ),
//
////            Text('Selected Item = ' + '$dropdownValue' ?? '',
////                style: TextStyle
////                  (fontSize: 22,
////                    color: Colors.black)),
//                  ]),
//
//              Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Padding(
//                  padding: const EdgeInsets.only(left: 30, right: 20.0),
//                  child: Container(
//                    child: Text("Department"),
//                  ),
//                ),
//                DropdownButton<String>(
//                  value: departmentSelection,
//                  icon: Icon(Icons.arrow_drop_down),
//                  iconSize: 24,
//                  elevation: 16,
//                  style: TextStyle(color: Colors.red, fontSize: 18),
//                  underline: Container(
//                    height: 2,
//                    color: Colors.deepPurpleAccent,
//                  ),
//                  onChanged: (String data) {
//                    setState(() {
//                      departmentSelection = data;
//                    });
//                  },
//                  items: departmentSpinner.map<DropdownMenuItem<String>>((String value) {
//                    return DropdownMenuItem<String>(
//                      value: value,
//                      child: Text(value??""),
//                    );
//                  }).toList(),
//                ),
//
////            Text('Selected Item = ' + '$dropdownValue' ?? '',
////                style: TextStyle
////                  (fontSize: 22,
////                    color: Colors.black)),
//              ]),
//
//              Row(
//                mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                  Padding(
//                    padding: const EdgeInsets.only(left: 30, right: 20.0),
//                    child: Container(
//                      child: Text("Role"),
//                    ),
//                  ),
//                DropdownButton<String>(
//                  value: dropdownValue,
//                  icon: Icon(Icons.arrow_drop_down),
//                  iconSize: 24,
//                  elevation: 16,
//                  style: TextStyle(color: Colors.red, fontSize: 18),
//                  underline: Container(
//                    height: 2,
//                    color: Colors.deepPurpleAccent,
//                  ),
//                  onChanged: (String data) {
//                    setState(() {
//                      dropdownValue = data;
//                    });
//                  },
//                  items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
//                    return DropdownMenuItem<String>(
//                      value: value,
//                      child: Text(value??""),
//                    );
//                  }).toList(),
//                ),
//
////            Text('Selected Item = ' + '$dropdownValue' ?? '',
////                style: TextStyle
////                  (fontSize: 22,
////                    color: Colors.black)),
//              ]),
//            ],
//          ),
//


        ],
        ),
      ),
    );
  }
}


