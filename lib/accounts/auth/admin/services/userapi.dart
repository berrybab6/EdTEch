//import 'package:http/http.dart' as http;
//
//class UserApi{
//  final http.Client httpClient = http.Client();
//  // ignore: non_constant_identifier_names
//  final _base_url = "http://10.5.240.30:8000";
//
//  Future<User> userLogin(String email, String password) async {
////    final _baseUrl = '10.5.240.30:8000';
////    final http.Client httpClient=http.Client();
//
////    final _base = "https://10.5.211.42:8000";
////    final _tokenEndpoint = "/api-token-auth/";
////    final _tokenURL = _base + _tokenEndpoint;
//
//    final response = await httpClient.post(
//      Uri.http('$_baseUrl','users/login/'),
//      headers: <String, String>{
//        'Content-Type': 'application/json; charset=UTF-8',
//      },
//
//      body: jsonEncode(<String, dynamic>{
//
//        'email': email,
//        'password': password
//
//      },
//      ),
//    );
//
//    if (response.statusCode == 200) {
//      // If the server did return a 201 CREATED response,
//      // then parse the JSON.
//      return User.fromJson(jsonDecode(response.body));
//    } else {
//      // If the server did not return a 201 CREATED response,
//      // then throw an exception.
//      throw Exception('Failed to load user');
//    }
//  }
//
//}