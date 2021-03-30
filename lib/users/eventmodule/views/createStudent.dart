//import 'dart:js';

import 'dart:collection';

import 'package:ed_tech/users/eventmodule/controller/RegisterSController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:spring_button/spring_button.dart';

//import 'Sidebar.dart';
import 'package:ed_tech/users/eventmodule/views/createTeacher.dart';

class CreateStudent extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
//      routes: {
//        // When navigating to the "/" route, build the FirstScreen widget.
////        '/': (context) => Login(),
//        // When navigating to the "/second" route, build the SecondScreen widget.
////        '/signup': (context) => CreateAccount(),
//        '/teacher':(context) => CreateTeacher(),
//        '/sidebar':(context) => Sidebar(),
//      },
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
                          "Register Student",
                          style: TextStyle(
                              color:Colors.black,
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      )
                  ),
                  SizedBox(height: 20.0,),

                  SignupStudentForm(),
                ],
              )
          ),
        ),
      ),
    );
  }
}


//class SignupStudentForm extends StatefulWidget {
//  @override
//  _SignupStudentFormState createState() => _SignupStudentFormState();
//}


String dropdownValue ="Select your role";
List<String> spinnerItems = [
  'Select your role',
  'Teacher',
  'Student'
] ;


class SignupStudentForm extends StatefulWidget {
  @override
  _SignupStudentFormState createState() => _SignupStudentFormState();
}



class _SignupStudentFormState extends State<SignupStudentForm> {


  RegisterSController regStud = Get.put(RegisterSController());
//  Future<User> _userLogin;

//  String departmentSelection = "Select your department";


  Map<String, int> myMap = {'Software': 7, 'Select your department':10,'Chemical':6, 'Electrical': 1, 'Civil': 2, 'Mechanical':3,"Biomed":4,"IT":5};


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


  Padding departmentDrop(){
        return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[


              Container(
              color: Colors.grey[200],
              margin: EdgeInsets.symmetric(horizontal:10),
              child: Obx((){
                return DropdownButton<String>(items: [
                  DropdownMenuItem(child: Text("Select your Department"),value: "Select your Department",),
                  DropdownMenuItem(
                      value: "Software",
                      child: Text("Software")),
                  DropdownMenuItem(
                      value: "IT",
                      child: Text("IT")),
                  DropdownMenuItem(child: Text("Chemical"),value: "Chemical",),
                  DropdownMenuItem(value: "Electrical",child:Text("Electrical")),
                  DropdownMenuItem(child: Text("Civil"),value: "Civil",),
                  DropdownMenuItem(child:Text("Biomed"),value:"Biomed")
                ],
                  value: regStud.departmentSelection.value,
                  hint: Text("Select your Department"),
                  isExpanded: true,
                  onChanged: (selectedValue){
                    regStud.departmentSelection.value = selectedValue;
                  },
                );
              }),
        ),

//
//
//              Container(
//                color: Colors.grey[200],
//                margin: EdgeInsets.symmetric(horizontal: 10),
//                alignment: Alignment.center,
//                child: DropdownButton<String>(
//                  value: regStud.departmentSelection.value,
//                  icon: Icon(Icons.arrow_drop_down),
//                  iconSize: 24,
//                  elevation: 10,
//
//                  style: TextStyle(
//                      color: Colors.black,
//
//                      fontSize: 22),
////                                       underline: Container(
////                                         height: 2,
////                                         color: Colors.black,
////                                       ),
//                  onChanged: (String data) {
//                    regStud.departmentSelection(data);
////                    setState(() {
////                      regdepartmentSelection = data;
////                    });
////                    },
//                  },
//
//                  items: departmentSpinner.map<DropdownMenuItem<String>>((String value) {
//                    return DropdownMenuItem<String>(
//                      value: value,
//                      child: Text(value??""),
//                    );
//                  }).toList(),
//                ),
//              ),

//            Text('Selected Item = ' + '$dropdownValue' ?? '',
//                style: TextStyle
//                  (fontSize: 22,
//                    color: Colors.black)),
            ]),
      );
    }




  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
          children: [

              buildFullNameField(),


              buildUsernameField(),
            buildEmailField(),
            buildPasswordField(),
            buildBatchField(),
            departmentDrop(),
            SizedBox(height: 20.0,),
            registerButton(context),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.center,
////              crossAxisAlignment: CrossAxisAlignment.end,
//              children: [
//                finishButton(),
//              ],
//            )

          ],
        )
    );
  }

  GestureDetector nextButton(){

   return GestureDetector(
       onTap: (){
//         Navigator.of(context).pushNamed('/next');
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
       ));
  }

Widget registerButton(BuildContext context) {

      return SpringButton(
        SpringButtonType.OnlyScale,
        Container(
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(8.0),
            ),
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Center(
              child: Text('Register', style: TextStyle(fontSize: 22.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.5),),
            )
        ),
        scaleCoefficient: 0.9,
        useCache: false,
        onTap: () {
//          Navigator.of(context).pushNamed('/sidebar');
//    var a = myMap[regStud.departmentSelection.value];
            regStud.apiRegister(regStud.departmentSelection.value);
        },
      );


}


  GestureDetector finishButton(BuildContext context){
    return GestureDetector(
        onTap: (){

          Navigator.of(context).pushNamed('/sidebar');
//                      setState(() {
//                        _userLogin = userLogin(emailController.text, passwordController.text, fullNameController.text, userNameController.text);
//
//                      });
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
        ));
  }


  Padding buildFullNameField(){
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: TextFormField(
        autofocus: false,
//                              validator: (val) => val.isEmpty ? 'Empty Field' : null,
        controller: regStud.fullNameController,
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
    );

  }



  Padding buildUsernameField(){
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child:TextFormField(
      autofocus: false,
//                              validator: (val) => val.isEmpty ? 'Empty Field' : null,
      controller: regStud.usernameController,
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
    ));
  }



  Padding buildBatchField(){
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child:TextFormField(
          autofocus: false,
//                              validator: (val) => val.isEmpty ? 'Empty Field' : null,
          controller: regStud.batchController,
          keyboardType: TextInputType.numberWithOptions(decimal: false, signed: false),
          style: TextStyle(fontSize: 20.0, color: Colors.black, letterSpacing: 1.0,),
//                              onChanged: (val){
//
//                              },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
            hintText: 'Enter Student Batch',
            labelText: "Batch",
            hintStyle: TextStyle(fontSize: 16.0, color: Colors.grey[900],),
            filled: true,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            fillColor: Colors.grey[200],
//            suffixIcon: IconButton(icon: Icon(Icons.person_outline),),
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
        ));
  }



  Padding buildPasswordField(){
    return  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child:TextFormField(


      autofocus: false,
//                        validator: (val) => val.isEmpty ? 'Empty Field' : null,

      controller: regStud.passwordController,
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

    ));
  }

  Padding buildEmailField(){
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child:TextFormField(
      autofocus: false,
      controller: regStud.emailController,
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
    ));
  }


}
//        FutureBuilder<User>(
//          future: _userLogin,
//          builder: (context, snapshot) {
//            if (snapshot.hasData) {
//              // ignore: unrelated_type_equality_checks
//              return (snapshot.data.full_name != null )?ListTile(
//                title:Text(snapshot.data.full_name.toString()) ,
//                leading: Text(snapshot.data.email.toString()),
//                subtitle: Text(snapshot.data.username.toString()),
//              ):Text("NOT A User");
////      Text(snapshot.data.email == true?snapshot.data.email.toString():"not a student ");
//            } else if (snapshot.hasError) {
//              return Text("${snapshot.error}");
//            }
//
//            return CircularProgressIndicator();
//          },
//        ))
//    ;


