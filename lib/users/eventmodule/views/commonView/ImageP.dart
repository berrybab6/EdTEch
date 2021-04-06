import 'dart:convert';
import 'dart:io';
import 'package:ed_tech/users/eventmodule/controller/upLoadImage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

//void main() {
//  runApp(MyApp());
//}
//
//
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: ImageUploadPages(),
//    );
//  }
//}

class ImageUploadPages extends StatelessWidget {
  ImageUploadController iController = Get.put(ImageUploadController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('UploadImage'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top:16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => iController.selectedImagePath.value == ''?
                Text('Please Select an Image from Camera/Gallery', style: TextStyle(
          color: Colors.grey[600],
          fontSize: 20.0,
        ),):Container(
                width: 500,
                height: 400,
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

              Container(
                width: 150,
                color: Colors.black,
                child: ElevatedButton(
                  child: Center(child: Text('Send',style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white
                  ),),),
                  onPressed: (){
                    iController.uploadImage(iController.selectedImagePath.value);
                  },
                ),
              )

            ],

          ),
        ),
      ),
    );
  }
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<File> file;
  String status = '';
  String base64Image;
  File tmpFile;
  String error = 'Error';

  chooseImage() {
    setState(() {
      file = ImagePicker.platform.pickImage(source: ImageSource.gallery) as Future<File>;
    });
    setStatus('');
  }

  setStatus(String message) {
    setState(() {
      status = message;
    });
  }

  uploadImg() {
    if (null == tmpFile) {
      setStatus(error);
      return;
    }

    String fileName = tmpFile.path.split('/').last;

    upload(fileName);
  }

  upload(String fileName) {
    http.post(Uri.http('10.5.230.245', 'users/detail/'),
        body: {
      "image": base64Image,
      "name": fileName,
    }).then((result) {
      setStatus(result.statusCode == 200 ? result.body : error);
    }).catchError((error) {
      setStatus(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Image/Data'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<File>(
              future: file,
              builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    null != snapshot.data) {
                  tmpFile = snapshot.data;
                  base64Image = base64Encode(snapshot.data.readAsBytesSync());
                  return Container(
                    margin: EdgeInsets.all(15),
                    child: Material(
                      elevation: 3.0,
                      child: Image.file(
                        snapshot.data,
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                } else if (null != snapshot.error) {
                  return const Text(
                    'Error!',
                    textAlign: TextAlign.center,
                  );
                } else {
                  return Container(
                    margin: EdgeInsets.all(15),
                    child: Material(
                      elevation: 3.0,
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Container(
                            child: Image.asset('assets/placeholder-image.png'),
                          ),
                          InkWell(
                            onTap: () {
                              chooseImage();
                            },
                            child: Padding(
                              padding: EdgeInsets.only(top: 10.0, right: 10.0),
                              child: Icon(
                                Icons.edit,
                                size: 30.0,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              height: 50.0,
              width: 360.0,
              child: RaisedButton(
                child: Text(
                  'Upload Image',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                color: Colors.blue,
                onPressed: () {
                  uploadImg();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}