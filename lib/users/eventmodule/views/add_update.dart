import 'dart:io';

import 'package:ed_tech/users/eventmodule/controller/upLoadImage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spring_button/spring_button.dart';


class ImagePick extends StatefulWidget {
  @override
  _ImagePickState createState() => _ImagePickState();
}

class _ImagePickState extends State<ImagePick> {
  ImageUploadController iController = Get.put(ImageUploadController());


  File _image;
  final picker = ImagePicker();
  bool imageGetClicked = false;



  Future getImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);

    setState(() {
      if (pickedFile != null) {

        setState(() {
          _image = File(pickedFile.path);
        });
      } else {
        print('No image selected.');
      }
      setState(() {
        imageGetClicked = false;
      });
    });
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  Widget bigContainer(){
    double wd = MediaQuery.of(context).size.width;
    double ht = MediaQuery.of(context).size.height;

    return Container(
        child: Stack(
        children: [
        Form(
//        key: _formKey,
//        autovalidate: _autoValidate,
        child: Container(
        width: wd,
        height: ht,
        color: Colors.white,
        child: ListView(
        children: [

           Container(

                 margin: EdgeInsets.only(bottom: 15.0),

             child: ClipRRect(

               borderRadius: BorderRadius.only(bottomRight: Radius.circular(20.0), bottomLeft: Radius.circular(10.0)),

               child: Container(

                 width: MediaQuery.of(context).size.width,

                 height: MediaQuery.of(context).size.width*0.65,

                 decoration: _image != null ? BoxDecoration(

                   color: Colors.grey[200],

                   image: DecorationImage(

                       image: FileImage(_image),

                       fit: BoxFit.cover

                   ),




                 ):
                 BoxDecoration(

                   color: Colors.grey[200],


                   ),

                 child: Container(

                   alignment: Alignment.bottomCenter,

                   child: Container(


                     width: 65.0,

                     height: 65.0,

                     decoration: BoxDecoration(

                       color: Colors.white,

                       borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),

    ),


                     child: IconButton(


                       iconSize: 45,


                       icon: Icon(Icons.camera_alt, color: Colors.black87),


                       onPressed: (){


                         setState(() {


                           imageGetClicked = true;

                         });

                         },

                     ),

                   ),

                 ),

               ),

             ),

           ),



          Padding(

            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),

            child: TextFormField(

              autofocus: false,

              validator: (val) => val.isEmpty ? 'Empty Field' : null,
//    controller: titleController,

              keyboardType: TextInputType.text,

              style: TextStyle(fontSize: 18.0, color: Colors.black, letterSpacing: 0.5,),

              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(
                    fontSize: 23,
                    color: Colors.black54
                ),

                contentPadding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10),

                hintText: 'mish@gmail.com',

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

              validator: (val) => val.isEmpty ? 'Empty Field' : null,
//    controller: titleController,

              keyboardType: TextInputType.text,


              style: TextStyle(fontSize: 18.0, color: Colors.black, letterSpacing: 0.5,),

              decoration: InputDecoration(
                labelText: 'Full_name',
                labelStyle: TextStyle(
                    fontSize: 23,
                    color: Colors.black54
                ),
                contentPadding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10),

                hintText: 'Misha Assefa',

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

              validator: (val) => val.isEmpty ? 'Empty Field' : null,
//    controller: titleController,

              keyboardType: TextInputType.text,

              style: TextStyle(fontSize: 18.0, color: Colors.black, letterSpacing: 0.5,),

              decoration: InputDecoration(
                labelText: 'Username',
                labelStyle: TextStyle(
                  fontSize: 23,
                  color: Colors.black54
                ),

                contentPadding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10),

                hintText: 'mishAssefa',

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




          SizedBox(height: 15.0,),

          SpringButton(
            SpringButtonType.OnlyScale,
            Container(
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                width: MediaQuery.of(context).size.width,
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Center(
                  child: Text('Update', style: TextStyle(fontSize: 22.0, color: Colors.white, fontWeight: FontWeight.w400, letterSpacing: 1.5),),
                )
            ),
            scaleCoefficient: 0.9,
            useCache: false,
            onTap: (){
                iController.imagefile.value = _image;
                iController.uploadImage(iController.imagefile.value);

              },

          ),
        ],
        ),
        ),
        ),





          imageGetClicked ? Container(
            color: Colors.black54,
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width*0.75,
                height: MediaQuery.of(context).size.width*0.6,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('From', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w500, letterSpacing: 0.5, color: Colors.grey[900]),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              iconSize: 45,
                              icon: Icon(Icons.camera, color: Colors.orange),
                              onPressed: () async{
                                await getImage(ImageSource.camera);
                              },
                            ),
                            Text('Camera', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400, letterSpacing: 1.0, color: Colors.grey[800]),),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              iconSize: 45,
                              icon: Icon(Icons.photo, color: Colors.orange),
                              onPressed: () async{
                                await getImage(ImageSource.gallery);
                              },
                            ),
                            Text('Gallery', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400, letterSpacing: 1.0, color: Colors.grey[800]),),
                          ],
                        ),
                      ],
                    ),
                    TextButton.icon(
                      icon: Icon(Icons.close),
                      label: Text('Cancel'),
                      onPressed: (){
                        setState(() {
                          imageGetClicked = false;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ) : Container(),



        ]

        ));



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: bigContainer(),
      ),
    );
  }
}
