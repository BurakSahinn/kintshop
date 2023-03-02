import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:kintshop_task/constants/base_urls.dart';
import 'package:kintshop_task/models/login_model.dart';
import 'package:kintshop_task/models/register_model.dart';
import 'package:kintshop_task/services/base_service_requests.dart';

class AuthServices {
  Future<RegisterModel?> postRegisterInfoToService(
    String name,
    String surname,
    String email,
    String password,
    String mobile,
  ) async {
    try {
      Response? response =
          await BaseServiceRequests.postRequest(BaseUrls.registerUrl, {
        "first_name": name,
        "last_name": surname,
        "email": email,
        "phone": mobile,
        "password": password,
      });

      if (response != null && response.body.isNotEmpty) {
        Map<String, dynamic> responseData = json.decode(response.body);
        RegisterModel registerModel = RegisterModel.fromJson(responseData);
        return registerModel;
      } else {
        RegisterModel registerModel = RegisterModel(
          refresh: "",
          access: "",
          message: "Bir hata meydana geldi",
        );
      }
    } catch (e) {
      RegisterModel registerModel = RegisterModel(
        refresh: "",
        access: "",
        message: e.toString(),
      );
    }
    return null;
  }

  Future<LoginModel?> postLoginInfoToService(
    String email,
    String password,
  ) async {
    try {
      Object body = jsonEncode({
        "email": email,
        "password": password,
      });
      Response? response =
          await BaseServiceRequests.postRequest(BaseUrls.loginUrl, body);

      if (response != null && response.body.isNotEmpty) {
        Map<String, dynamic> responseData = json.decode(response.body);
        LoginModel loginModel = LoginModel.fromJson(responseData);
        return loginModel;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
