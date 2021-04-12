import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ed_tech/users/eventmodule/models/User.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class UsersApi{
  static var client = http.Client();
  static var _baseUrl = "10.5.226.205:8000";
  static final userdata = GetStorage();


//    `
  static Future<String> uploadProfilePic(File profile) async{

    String name = '';

    var req = http.MultipartRequest('PUT', Uri.parse('$_baseUrl/users/detail/'));
    req.files.add(
        http.MultipartFile(
            'profile_url',
            File(profile.path).readAsBytes().asStream(),
            File(profile.path).lengthSync(),
            filename: profile.path.split("/").last
        ));

    try{
      var res = await req.send();
      name = await res.stream.transform(utf8.decoder).elementAt(0);
    }catch(e){
      print("//*** Error: $e");
    }

    return name;

  }




  static Future<List<User>> getUsers() async{
    var token = userdata.read('token');
    var response = await client.get(Uri.http(_baseUrl, "users/"),
      headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization':'Token $token'
//          'd14b6a14ed429ffc6e2c0975791db02417733d95'
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

  static Future<dynamic> upLoadPicture(String _image) async{
    String token = userdata.read('token');
    var uri = Uri.parse('https://10.5.226.205:8000/users/detail/');

    var request = http.MultipartRequest('POST', uri);
    Map<String, String> headers = { "Authorization": token};
    request.headers.addAll(headers);
    request.files.add(
        http.MultipartFile(
            'profile_url',
            File(_image).readAsBytes().asStream(),
            File(_image).lengthSync(),
            filename: _image.split("/").last
        )
    );
    print('imagee: $_image');


//    if (request.statusCode == 200) print('Uploaded!');

    final response = await client.put(Uri.http('$_baseUrl','users/detail/'),body: <String, dynamic>{
      'profile_url':_image
    });

  }

  static Future<List<dynamic>> changePassword(String oldPassword, String newPassword) async{
    var token = userdata.read('token');
    final resp = await client.put(Uri.http('$_baseUrl', 'users/changePassword/'),
        headers:<String,String> {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization':'Token $token'
        }
        ,body:jsonEncode(<String, dynamic> {
      'newpassword':newPassword,
      'password':oldPassword
    })
    );

    print("Change Password please work");
    Map<String, dynamic> msg = json.decode(resp.body);
    var message = msg['message'];
    if(resp.statusCode == 201){

      return [true,message];
    }else{
      return [false, message];
    }
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
     print(user.id);
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



  //////UPLOAD IMAGE
static void uploadImage() async{

//    Dio dio = Dio();
//    FormData formatData = FormData();
//    formatData.files.add('profile_url',)

}


}
