// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

class LoginModel {
  LoginModel({
    required this.refresh,
    required this.access,
  });

  String? refresh;
  String? access;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        refresh: json["refresh"],
        access: json["access"],
      );
}
