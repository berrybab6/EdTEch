import 'package:ed_tech/users/eventapi/usersapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterSController extends GetxController{

  TextEditingController fullNameController;
  TextEditingController emailController;
  TextEditingController passwordController;
  var departmentSelection ="Select your Department".obs;
  TextEditingController usernameController;
  TextEditingController batchController;
//  Map<int,String> myMap = {7:'Software', 10:'Select your department',6:'Chemical',1:'Electrical', 2:'Civil', 3:'Mechanical',4:"Biomed",5:"IT"};


  @override
  void onInit() {

    fullNameController = TextEditingController();
    passwordController = TextEditingController();
    emailController = TextEditingController();
    usernameController = TextEditingController();
    batchController = TextEditingController();
    super.onInit();
  }


  void apiRegister(String dep) async {
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
//    dep(dept);
    var departmentName;

    if(dep == "Select your Department"){
      departmentName = "";
    }else{
        departmentName = dep;
    }

    var request = await UsersApi.register(
        emailController.text, passwordController.text,1, usernameController.text, fullNameController.text,batchController.text,departmentName);
    if (request != null) {
      Get.back();
      print(dep);
      Get.offNamed('/');
    } else {
      print("Error Found");
    }



  }



}