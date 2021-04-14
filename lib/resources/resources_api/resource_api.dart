import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ed_tech/resources/resources_module/models/resources.dart';
import 'package:ed_tech/users/eventmodule/models/User.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ResourceApi{
  static var client = http.Client();
  static var _baseUrl = "10.5.211.42:8000";
  static final userdata = GetStorage();


  static Future<List<Resource>> getResources() async{
    var token = userdata.read('token');
    var response = await client.get(Uri.http(_baseUrl, "resources/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':'Token $token'
//          'd14b6a14ed429ffc6e2c0975791db02417733d95'
      },);

    if(response.statusCode == 200) {
      List<Resource> resourceModel = [];
      Map<String, dynamic> myMap = json.decode(response.body);
      List<dynamic> resources = myMap["resources"];

      resources.forEach((resource) {
        resourceModel.add(
            Resource.fromJson(resource)
        );
      });

      return resourceModel;
    }else {
      print("ooops resource isnot been able to returned");
      return null;
    }
    //
//    }else{
//      return [false, 'Error getting events'];
//    }
  }



}
