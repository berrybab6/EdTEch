//import 'dart:js';

import 'dart:io';

import 'package:ed_tech/users/eventmodule/controller/common/config.dart';
import 'package:ed_tech/users/eventmodule/controller/upLoadImage.dart';
import 'package:ed_tech/users/eventmodule/controller/userController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spring_button/spring_button.dart';
import 'package:path/path.dart' as path;

class UserProfile extends StatelessWidget {

  UserController userController= Get.put(UserController());
  ImageUploadController iController = Get.put(ImageUploadController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Stack(
        alignment: Alignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 250),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,

              children: [
                Container(

                  height: 300,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,


                  child: Column(
//                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      buildTextField1(hintText: 'Username'),
                      SizedBox(height: 20,),
                      buildTextField1(hintText: 'Full_Name'),
                      SizedBox(height: 20,),
                      buildTextField1(hintText: 'Email')

                    ],
                  ),

                ),
                updateButton(context)
              ],
            ),
          ),
          CustomPaint(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            painter: HeaderContainer(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(

                  padding: EdgeInsets.all(20),
              child: Container(
                margin: EdgeInsets.only(top: 15),
                child: Text(
                  'Profile',
                  style: TextStyle(
                    color:Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 24.0,

                    ),
                ),
              ),
              ),

              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(
                  top: 20
                ),
                width: MediaQuery.of(context).size.width/2,
                height: MediaQuery.of(context).size.width/2,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 5),
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image:NetworkImage('http://10.5.226.205:8000/users/images/mish/')
                  )
                ),
              )
            ],
          ),

          Padding(padding: EdgeInsets.only(bottom: 280, left:174),
          child: CircleAvatar(
            backgroundColor: Colors.black,
            child: IconButton(
              icon: Icon(Icons.camera_alt, color:Colors.white,),
              onPressed: (){
                _pickImage(context);
//                Get.toNamed('/edit');
              },
            ),
          ),),

//          buildEditSection()
//          SizedBox(
//            height: 35,
//          ),
//          Container(
//            margin: EdgeInsets.only(top: 250),
//            child: Column(
//              children: [
//                buildTextField("Full Name", "Dor Alex", false),
//                SizedBox(height: 32,),
//                buildTextField("E-mail", "alexd@gmail.com", false),
////                buildTextField("Password", "********", true),
//                buildTextField("Location", "TLV, Israel", false),
//
//              ],
//            ),
//    ),


        ],
      )
    );
  }



  void _pickImage(BuildContext context) async {
    int i = 0;
    final imageSource = await showDialog<ImageSource>(
        context: context,
        builder: (context) =>
             AlertDialog(
//              title: Text("Select the image source"),
              actions: <Widget>[Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() => iController.selectedImagePath.value == ''?
                  Text('Please Select an Image', style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 20.0,
                  ),):Container(
                    width: 200,
                    height: 200,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Image.file(File(iController.selectedImagePath.value)
                    ),
                  )
                  ),

                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [


                        Container(
                          width: 100,
                          child: MaterialButton(
                            color: Colors.orange,
                            splashColor: Colors.purple,
                            onPressed: (){
                              iController.getImage(ImageSource.camera);
                            },
                            child: Center(
                              child: Text('Camera'),
                            ),),
                        ),

                        SizedBox(width: 20,),

                        Container(
                          width: 100,
                          color: Colors.grey[800],
                          child: MaterialButton(
                            onPressed: (){
                              iController.getImage(ImageSource.gallery);
                            },
                            child: Center(
                              child: Text('Gallery',style: TextStyle(
                                  color: Colors.white
                              ),),
                            ),),
                        ),

                      ]),

                  SizedBox(height: 20,),

                uploadButton(context),

                ],

              ),
    ]
    ));


//    if(imageSource != null) {
//      final file = await ImagePicker.pickImage(source: imageSource);
//      if(file != null) {
//        iController.getImage(ImageSource.camera);
//      }
//    }
  }

  SpringButton uploadButton(BuildContext context) {
    return SpringButton(
      SpringButtonType.OnlyScale,
      Container(
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(8.0),
          ),
          width: 100,
          height: 50,
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Center(
            child: Text('Upload', style: TextStyle(fontSize: 22.0,
                color: Colors.white,
                fontWeight: FontWeight.w400,
                letterSpacing: 1.5),),
          )
      ),
      scaleCoefficient: 0.9,
      useCache: false,
      onTap: (){
        String basepathname = path.basename(iController.selectedImagePath.value);
//        iController.uploadImage(basepathname);
      },
    );
  }


  SpringButton updateButton(BuildContext context) {
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
            child: Text('Update', style: TextStyle(fontSize: 22.0,
                color: Colors.white,
                fontWeight: FontWeight.w400,
                letterSpacing: 1.5),),
          )
      ),
      scaleCoefficient: 0.9,
      useCache: false,
      onTap: () {
//        regContr.apiRegister();
//        Navigator.of(context).pushNamed('/sidebar');
      },
    );
  }


  Widget buildTextField1({@required String hintText}){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 7,

        shadowColor: Colors.grey[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(

          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              letterSpacing: 2,
              color: Colors.black54,


//            fontSize: 34,
              fontWeight: FontWeight.bold

            )
          ),
        ),
      ),
    );
  }


  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Container(
//      margin: EdgeInsets.only(top: 70),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 35.0),
        child: TextField(
          obscureText: isPasswordTextField ? userController.isVisible.value : false,
          decoration: InputDecoration(
              suffixIcon: isPasswordTextField
                  ? IconButton(
                onPressed: () {
                  userController.isVisible(!userController.isVisible.value);

                },
                icon: Icon(
                  Icons.remove_red_eye,
                  color: Colors.grey,
                ),
              )
                  : null,
              contentPadding: EdgeInsets.only(bottom: 3),
              labelText: labelText,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: placeholder,
              hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              )),
        ),
      ),
    );
  }
}



class HeaderContainer extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color=Colors.black;
    Path path = Path()
    ..relativeLineTo(0,200)
      ..quadraticBezierTo((size.width)/2, 250, size.width, 200)
      ..relativeLineTo(0,-200)
    ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
  
}
