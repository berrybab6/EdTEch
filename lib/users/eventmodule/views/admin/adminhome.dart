import 'package:ed_tech/users/eventmodule/controller/common/drawer.dart';
import 'package:ed_tech/users/eventmodule/models/User.dart';
import 'package:ed_tech/users/eventmodule/views/createStudent.dart';
import 'package:ed_tech/users/eventmodule/views/createTeacher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spring_button/spring_button.dart';

class AdminHome extends StatelessWidget {
  var data = Get.arguments as User;
//  CommonWidgets commonWidgets = CommonWidgets();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50.0,
          backgroundColor: Colors.black,
          title: Center(child: Text(
              'Home',
              style:TextStyle(
                fontSize: 33.0,
              )
          ),),
        ),
        drawer: Drawer(

          child: CommonWidgets.sidebarList(context,data),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15,),
//                  color: Colors.deepOrangeAccent,
                child: Text(
                  'View Users',
                  style: TextStyle(
                    fontSize: 33.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(padding: EdgeInsets.symmetric(horizontal: 3.0),
                      child: buildDashboard('View Students', 1, context),
                    ),
                  ),
                  Expanded(
                    child: Padding(padding: EdgeInsets.symmetric(horizontal: 3.0),
                      child: buildDashboard('View Teachers', 2, context),
                    ),
                  )
                ],
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15,),
//                  color: Colors.deepOrangeAccent,
                child: Text(
                  'Register Users',
                  style: TextStyle(
                    fontSize: 33.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Padding(padding: EdgeInsets.symmetric(horizontal: 3),
                      child: buildDashboard('Add Student', 3, context),
                    ),
                  ),
                  Expanded(
                    child: Padding(padding: EdgeInsets.symmetric(horizontal: 3.0),
                      child: buildDashboard('Add Teacher', 4, context),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  SpringButton buildDashboard(String name, int role, BuildContext context) {
    return SpringButton(
      SpringButtonType.OnlyScale,
      Container(
          decoration: BoxDecoration(
            color: Colors.deepOrangeAccent.withOpacity(0.8),
            borderRadius: BorderRadius.circular(8.0),
          ),
          width:235,
          height: 150,
          margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
          child: Center(
            child: Text(name, style: TextStyle(fontSize: 25.0,
                color: Colors.white,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.5),
            ),
          )
      ),
      scaleCoefficient: 0.9,
      useCache: false,
      onTap: () {
        if (role == 1) {
          Get.toNamed('/users');
//          Navigator.of(context).push(
//
//              MaterialPageRoute(builder: (contect) => CreateStudent()));
        } else if (role == 2) {
          Get.toNamed('/users');
//          Navigator.of(context).push(
//              MaterialPageRoute(builder: (context) => CreateTeacher()));
        } else if(role == 3)
          {
            Get.toNamed('/registerS');
          }else if(role == 4){
          Get.toNamed('/register');
        }
         else {
          Navigator.of(context).pushNamed('/sidebar');
        }
      },
    );
  }




  GestureDetector logout(BuildContext context){
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Text(
          "Logout",
          style: GoogleFonts.pacifico(
            textStyle: TextStyle(
              fontSize: 24.0
            )
          ),
        ),
      ),
    );
  }
}
