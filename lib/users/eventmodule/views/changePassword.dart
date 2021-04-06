import 'package:ed_tech/users/eventmodule/controller/changePassswordController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spring_button/spring_button.dart';

class ChangePassword extends StatelessWidget {
  ChangePassController changeP = Get.put(ChangePassController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                'Change Password',
                style: GoogleFonts.sourceSerifPro(
                  textStyle: TextStyle(
                    fontSize: 27.0,
                    color: Colors.deepOrangeAccent.withOpacity(0.7)
                  )
                ),
              ),
            ),

            Container(
//              color: Colors.grey[200],
              padding: EdgeInsets.all(30.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
                
              ),
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child:Column(
                children: [
                  Container(
                    width: 220,
                    
                    child: TextFormField(
                    controller: changeP.oldpass,
                      keyboardType: TextInputType.text,
                      obscureText: true,
//                initialValue: "mish@gmail.com",
                      autofocus: false,
                      decoration: InputDecoration(
                          hintText: "Old Password",
                          contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0)
                          )
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: 220,
                    child: TextFormField(
                    controller: changeP.newpass,
                      keyboardType: TextInputType.text,
                      obscureText: true,
//                initialValue: "",
                      autofocus: false,
                      decoration: InputDecoration(
                          hintText: "New Password",
                          contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0)
                          )
                      ),
                    ),
                  ),

//                  registerButton(context),
                ],
              )
            ),
            registerButton(context),
          ],
        ),
      ),
    );
  }


  Widget registerButton(BuildContext context) {

    return SpringButton(
      SpringButtonType.OnlyScale,
      Container(
        width: 150,
          decoration: BoxDecoration(

            color: Colors.deepOrangeAccent.withOpacity(0.7),
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: 50,
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Center(
            child: Text('Change', style: TextStyle(fontSize: 22.0,
                color: Colors.white,
                fontWeight: FontWeight.w400,
                letterSpacing: 1.5),),
          )
      ),
      scaleCoefficient: 0.9,
      useCache: false,
      onTap: () {
        changeP.changePassword();
        Get.back();
        print("hey from changePassword");
//          Navigator.of(context).pushNamed('/sidebar');
//    var a = myMap[regStud.departmentSelection.value];
//        regStud.apiRegister(regStud.departmentSelection.value);
      },
    );


  }

}
