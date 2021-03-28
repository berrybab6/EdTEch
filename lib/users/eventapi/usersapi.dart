import 'dart:convert';

import 'package:ed_tech/users/eventmodule/models/User.dart';
import 'package:http/http.dart' as http;

class UsersApi{
  static var client = http.Client();
  static var _baseUrl = "10.5.211.42:8000";

  static Future<List<User>> getUsers() async{
    var response = await client.get(Uri.http(_baseUrl, "users/"),headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    },);

    if(response.statusCode == 200) {
      List<User> userModel = [];
      Map<String, dynamic> myMap = json.decode(response.body);
      List<dynamic> users = myMap["users"];
      users.forEach((user) {
        userModel.add(
            User.fromJson(user)
        );
      });

      return userModel;
    }else{
      return [];
    }
      //
//    }else{
//      return [false, 'Error getting events'];
//    }
  }

  static Future<String> register(String email, String password, int role , String username, String fullName, String batch, String department) async{
    bool teach = false;
    bool stud = false;

    if(role == 1){
      stud = true;
      teach = false;
    }else if(role == 0){
      stud = false;
      teach = true;
    }

    final response = await client.post(Uri.http('$_baseUrl', 'users/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },

      body: jsonEncode(<String, dynamic>{

        'email': email,
        'password': password,
        'username': username,
        'full_name':fullName,
        'teacher':teach,
        'student':stud,
        'batch':batch,
        'department':department
      },
      ),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      var  user= User.fromJson(jsonDecode(response.body));
      return user.email;
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to load user');
    }
  }

  static Future<String> userLogin(String email, String password) async {
//    final _baseUrl = '10.5.240.120:8000';
//    final http.Client httpClient=http.Client();
//
//    final _base = "https://10.5.211.42:8000";
//    final _tokenEndpoint = "/api-token-auth/";
//    final _tokenURL = _base + _tokenEndpoint;

    final response = await client.post(
      Uri.http('$_baseUrl','users/login/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },

      body: jsonEncode(<String, dynamic>{

        'email': email,
        'password': password

      },
      ),
    );




    if (response.statusCode == 200 || response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
     var  user= User.fromJson(jsonDecode(response.body));
      return user.email;
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to load user');
    }
  }




}
