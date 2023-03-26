import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' hide Response hide FormData hide MultipartFile;
import 'package:mobile/services/api/base_url.dart';
import 'package:mobile/services/api/app_token.dart';
import 'package:dio/dio.dart';
import 'package:mobile/services/models/login/login.dart';
import 'package:mobile/services/models/register/register_model.dart';
import 'package:mobile/services/models/response.dart';

class PostApiService {
  static Map<String, dynamic> header() {
    return {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": UserToken.getToken(),
    };
  }

  static void showAlert(String msg, {bool? isSuccess = false}) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: isSuccess! ? Colors.green : Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  // static Future<ApiResponse<LoginModel>> login(data) async {
  static void login(data) async {
    final api = Dio();

    try {
      Response request =
          await api.post("$BASE_URL/api/login", data: jsonEncode(data));

      ApiResponse<LoginModel> response = ApiResponse.fromJson(request.data);
      showAlert('Login Successed', isSuccess: true);
      print(response.data!.token);

      if (response.data!.type == "user") {
        UserToken.setToken(response.data!.token);
      } else {
        AdminToken.setToken(response.data!.token);
      }
    } on DioError catch (e) {
      if (e.response != null) {
        final response = e.response!;
        showAlert(response.data['error']);
      } else {
        // Handle network error
        if (e.message != null) showAlert(e.message!);
      }
    }
  }

  static void register(Map<String, String> data) async {
    final api = Dio();

    try {
      Response request =
          await api.post("$BASE_URL/api/register", data: jsonEncode(data));

      final loginData = {
        'email': data['email'],
        'password': data['password'],
      };

      showAlert('Create Account Successed', isSuccess: true);

      login(loginData);
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
