import 'package:flutter/material.dart';
class User {
  final int id;
  final String full_name;
  final String email;
  final String password;
  final String gender;
  final String profile_url;
  final String department;
  final String username;
  final String batch;
  final bool student;
  final bool teacher;
  final String reset_link;
  final bool admin;


  User({this.id, this.full_name, this.username, this.email, this.password, this.gender,
      this.profile_url, this.reset_link, this.department, this.batch, this.student, this.teacher,
      this.admin});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      full_name: json['full_name'],
      email: json['email'],
      password: json['password'],
      gender: json['gender'],
      username: json['username'],
      profile_url: json['profile_url'],
      reset_link: json['reset_link'],
      department: json['department'],
      batch: json['batch'],
      student: json['student'],
      teacher: json['teacher'],
      admin: json['admin']

    );
  }
}