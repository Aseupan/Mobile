import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' hide Response hide FormData hide MultipartFile;
import 'package:mobile/models/login/login.dart';
import 'package:mobile/models/response.dart';
import 'package:mobile/routes/app_routes.dart';
import 'package:mobile/services/api/api_utils.dart';
import 'package:mobile/services/api/base_url.dart';
import 'package:mobile/services/api/app_token.dart';
import 'package:dio/dio.dart';

class PostApiService {
  // static Future<ApiResponse<LoginModel>> login(data) async {
  static void login(data) async {
    final api = Dio();

    try {
      Response request =
          await api.post("$BASE_URL/api/login", data: jsonEncode(data));

      ApiResponse<LoginModel> response = ApiResponse.fromJson(request.data);
      ApiUtils.showAlert('Login Successed', isSuccess: true);
      print(response.data!.token);

      if (response.data!.type == "user") {
        UserToken.setToken(response.data!.token);
      } else {
        AdminToken.setToken(response.data!.token);
      }
      Get.offAllNamed(RoutePage.home);
    } on DioError catch (e) {
      if (e.response != null) {
        final response = e.response!;
        ApiUtils.showAlert(response.data['error']);
      } else {
        // Handle network error
        if (e.message != null) ApiUtils.showAlert(e.message!);
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

      ApiUtils.showAlert('Create Account Successed', isSuccess: true);

      login(loginData);
    } on DioError catch (e) {
      if (e.response != null) {
        final response = e.response!;
        ApiUtils.showAlert(response.data['message']);
        throw Exception("Login failed: ${e.response!.statusCode}");
      } else {
        // Handle network error
        if (e.message != null) ApiUtils.showAlert(e.message!);
        throw Exception("Network error: ${e.message}");
      }
    }
  }
}
