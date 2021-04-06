import 'package:ed_tech/users/eventapi/usersapi.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ChangePassController extends GetxController{
  List<dynamic> message = List<dynamic>.empty(growable: true).obs;
  TextEditingController newpass;
  TextEditingController oldpass;

//  String message = ''.obs;

  @override
  void onInit() {
    newpass = TextEditingController();
    oldpass = TextEditingController();
    super.onInit();
  }

  void changePassword() async{


    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
    var request = await UsersApi.changePassword(oldpass.text, newpass.text);
    message.assignAll(request);
    if (request[0]) {
      Get.back();
      print("Success : ${request[1]}");
//      if(request.admin) {

//        Get.toNamed('/admin', arguments: request[1]);

    }

    else {
      print("Error:  ${request[1]}");
    }

  }

}