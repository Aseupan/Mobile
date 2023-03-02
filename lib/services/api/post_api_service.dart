import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' hide Response hide FormData hide MultipartFile;
import 'package:mobile/services/api/base_url.dart';
import 'package:mobile/services/api/user_token.dart';
import 'package:dio/dio.dart';
import 'package:mobile/services/models/login/login.dart';
import 'package:mobile/services/models/response.dart';

class PostApiService {
  static Map<String, dynamic> header() {
    return {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": UserToken.getToken(),
    };
  }

  static void showAlert(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static Future<ApiResponse<LoginModel>> login(data) async {
    final api = Dio();

    try {
      Response request =
          await api.post("$BASE_URL/api/login", data: jsonEncode(data));

      ApiResponse<LoginModel> response = ApiResponse.fromJson(request.data);
      return response;
    } on DioError catch (e) {
      if (e.response != null) {
        final response = e.response!;
        showAlert(response.data['message']);
        throw Exception("Login failed: ${e.response!.statusCode}");
      } else {
        // Handle network error
        if (e.message != null) showAlert(e.message!);
        throw Exception("Network error: ${e.message}");
      }
    }
  }
}
