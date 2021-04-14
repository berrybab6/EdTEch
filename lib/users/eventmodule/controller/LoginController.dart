import 'package:ed_tech/users/eventapi/usersapi.dart';
import 'package:ed_tech/users/eventmodule/models/User.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class LoginController extends GetxController {
  TextEditingController emailLController;
  TextEditingController passwordLController;



  @override
  void onInit() {
    emailLController = TextEditingController();
    passwordLController = TextEditingController();
    super.onInit();
  }

  void apiLogin() async {
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
    var request = await UsersApi.userLogin(
        emailLController.text, passwordLController.text);
    if (request !=null) {
      Get.back();
      if(request.admin) {

        Get.toNamed('/admin', arguments: request);
//        return request;
      }
      else if(request.student ){
        print("Heyyy");
        Get.offNamed('/resource',arguments: request);
//        return request;
      }
    }

    else {
      print("Error Found");
    }



  }
  @override
  void onClose() {
    emailLController?.dispose();
    passwordLController?.dispose();
    super.onClose();
  }

}
