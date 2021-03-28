import 'package:ed_tech/accounts/admin/MyDrawer.dart';
import 'package:ed_tech/accounts/admin/adminpage.dart';
import 'package:ed_tech/users/eventmodule/controller/RegisterTController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spring_button/spring_button.dart';

//import 'MyDrawer.dart';
//import 'adminpage.dart';

class CreateTeacher extends StatefulWidget {
  @override
  _CreateTeacherState createState() => _CreateTeacherState();
}

class _CreateTeacherState extends State<CreateTeacher> {
  RegisterController regContr = Get.put(RegisterController());

  //TextEditingController emailController = new TextEditingController();
  //TextEditingController passwordController = new TextEditingController();
  //TextEditingController usernameController = new TextEditingController();
  //TextEditingController fullNameController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/admin': (context) => AdminPage(),
      },
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: Drawer(
          child: MyDrawer(),
        ),
        body: SafeArea(
          child: SizedBox(
            width:double.infinity,
            child: Column(
              children: [

                Container(
                    margin: EdgeInsets.only(top: 30.0, bottom: 30.0),
                    alignment: Alignment.center,
                    child:Center(
                      child: Text(
                        "Register Teacher",
                        style: TextStyle(
                            color:Colors.black,
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    )
                ),
                SizedBox(height: 20.0,),


                Form(
                  child: Column(
                    children: [


                      buildFullNameField(),


                      buildUsernameField(),
                      buildEmailField(),
                      buildPasswordField(),
                      SizedBox(height:20.0,),
                      registerButton(),


                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  SpringButton registerButton() {
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
        regContr.apiRegister();
//        Navigator.of(context).pushNamed('/sidebar');
      },
    );
  }


  GestureDetector finishButton(){
    return GestureDetector(
        onTap: (){
          Navigator.of(context).pushNamed('/admin');
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
        controller: regContr.fullNameController,
        keyboardType: TextInputType.name,
        style: TextStyle(fontSize: 20.0, color: Colors.black, letterSpacing: 1.0,),
//                              onChanged: (val){
//
//                              },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
          hintText: "Enter Teacher's FullName",
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
          controller: regContr.usernameController,
          keyboardType: TextInputType.name,
          style: TextStyle(fontSize: 20.0, color: Colors.black, letterSpacing: 1.0,),
//                              onChanged: (val){
//
//                              },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
            hintText: "Enter teacher's UserName",
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


  Padding buildPasswordField(){
    return  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child:TextFormField(


          autofocus: false,
//                        validator: (val) => val.isEmpty ? 'Empty Field' : null,

          controller: regContr.passwordController,
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
          controller: regContr.emailController,
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
