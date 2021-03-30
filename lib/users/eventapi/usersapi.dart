import 'dart:convert';

import 'package:ed_tech/users/eventmodule/models/User.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class UsersApi{
  static var client = http.Client();
  static var _baseUrl = "10.6.201.28:8000";
  static final userdata = GetStorage();

  static Future<List<User>> getUsers() async{
    var token = userdata.read('token');
    var response = await client.get(Uri.http(_baseUrl, "users/"),headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
//      'Authorization':'Token $token'
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
    }else {
      print("i am Here");
      return null;
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
//      var  user= User.fromJson(jsonDecode(response.body));
      Map<String, dynamic> myMap = json.decode(response.body);
      User user2 = User.fromJson(myMap["user"]);

      return user2.email;
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to load user');
    }
  }

  static Future<User> userLogin(String email, String password) async {
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
     var  user2= User.fromJson(jsonDecode(response.body));
     Map<String, dynamic> myMap= json.decode(response.body);
     User user = User.fromJson(myMap['user']);
     userdata.write('isLoggedIn', true);
     var token = myMap["token"];
     userdata.write('token', token);
      return user;
//          if(user.admin){
//       return user;
//     }else if(user.student){
//       return 1;
//     }else if(user.teacher){
//       return 3;
//     }
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to load user');
    }
  }




}
