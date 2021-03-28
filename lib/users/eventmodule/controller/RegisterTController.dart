import 'package:ed_tech/users/eventapi/usersapi.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class RegisterController extends GetxController{
     TextEditingController emailController ;
     TextEditingController passwordController;
     TextEditingController usernameController;
     TextEditingController fullNameController;
//     TextEditingController genderController;
//     TextEditingController departmentController;



     @override
  void onInit() {
       emailController = TextEditingController();
       passwordController = TextEditingController();
       usernameController = TextEditingController();
       fullNameController = TextEditingController();
    super.onInit();
  }


     void apiRegister() async {
       Get.dialog(Center(child: CircularProgressIndicator()),
           barrierDismissible: false);
       var request = await UsersApi.register(
           emailController.text, passwordController.text,0, usernameController.text, fullNameController.text, "", "");
       if (request != null) {
         Get.back();
         Get.offNamed('/');
       } else {
         print("Error Found");
       }



     }
//
//     void apiSRegister() async {
//       Get.dialog(Center(child: CircularProgressIndicator()),
//           barrierDismissible: false);
//       var request = await UsersApi.register(
//           emailController.text, passwordController.text,1, usernameController.text, fullNameController.text);
//       if (request != null) {
//         Get.back();
//         Get.offNamed('/');
//       } else {
//         print("Error Found");
//       }
//
//
//
//     }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    fullNameController.dispose();
    super.onClose();
  }
}