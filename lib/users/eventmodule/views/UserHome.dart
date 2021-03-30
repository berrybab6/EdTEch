import 'package:ed_tech/users/eventmodule/models/User.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Home extends StatelessWidget {
  var userdata = GetStorage();
  @override
  Widget build(BuildContext context) {
    var data = Get.arguments as User;

    return Scaffold(
        body: Center(
            child: Container(
              width: 300,
              height: 300,
              color: Colors.orangeAccent,
              child: Center(
                child: Text(
                  "${userdata.read("token")}",
//                  "HOME ${data.username.toUpperCase()}",
                  style: TextStyle(
                    fontSize: 27.0,
                    color: Colors.white
                  ),
                ),
              ),
            )));
  }
}

