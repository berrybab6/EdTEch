import 'dart:io';

import 'package:ed_tech/users/eventapi/usersapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageUploadController extends GetxController{
    var selectedImagePath = ''.obs;
    var selectedImageSize = ''.obs;
    var imageSelected = 0.obs;
    var  imagefile = null.obs;


void getImage(ImageSource imageSource) async {
  final pickedFile = await ImagePicker().getImage(source: imageSource);

  if (pickedFile != null) {
    selectedImagePath.value = pickedFile.path;
    selectedImageSize.value =
        ((File(selectedImagePath.value)).lengthSync() / 1024 / 1024)
            .toStringAsFixed(2) + 'Mb';
  } else {
    Get.snackbar(
        'Error', 'No Image Selected', snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black, colorText: Colors.red);
  }
}

    void uploadImage(File _image) async{
      var resp = await UsersApi.uploadProfilePic(_image);

    }



    @override
  void onInit() {
//    _image = File();
  super.onInit();
  }

}