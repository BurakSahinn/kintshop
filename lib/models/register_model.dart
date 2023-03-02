// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

class RegisterModel {
  RegisterModel({
    required this.refresh,
    required this.access,
    required this.message,
  });

  String? refresh;
  String? access;
  String? message;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        refresh: json["refresh"],
        access: json["access"],
        message: json["message"],
      );
}
