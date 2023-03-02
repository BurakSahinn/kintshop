import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kintshop_task/constants/general_datas.dart';

class BaseServiceRequests {
  static Future<http.Response?> getRequest(String path) async {
    try {
      Uri apiAddress = Uri.parse(path);
      http.Response response = await http.get(apiAddress);
      return response;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  static Future<http.Response?> postRequest(String path, Object? body) async {
    try {
      Uri apiAddress = Uri.parse(path);
      http.Response response = await http.post(
        apiAddress,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${GeneralDatas.accessToken}'
        },
        body: body,
      );
      return response;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
