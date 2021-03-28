import 'dart:convert';
import 'dart:io';
//import 'package:ed_tech/accounts/User.dart';
import 'package:ed_tech/users/eventmodule/models/User.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

//import 'auth/admin/models/User.dart';

class UserDataProvider {

  static final _baseUrl = 'http://192.168.137.1:5000';
  final http.Client httpClient;


//  UserDataProvider(this.httpClient);
  UserDataProvider({@required this.httpClient}) : assert(httpClient != null);

  Future<User> userLogin(String email, String password) async {
    final response = await http.post(
      Uri.https('$_baseUrl', 'users/login/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password
      }),
    );
    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return User.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to load user');
    }
  }



}