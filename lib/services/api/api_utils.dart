import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' hide Response hide FormData hide MultipartFile;
import 'package:mobile/routes/app_routes.dart';
import 'package:mobile/services/api/app_token.dart';
import 'package:mobile/services/api/base_url.dart';

class ApiUtils {
  static Map<String, dynamic> header({bool? isAdmin = false}) {
    isAdmin = AdminToken.checkToken();
    return {
      'Accept': 'application/json',
      'Content-type': 'application/json',
      "Authorization":
          'Bearer ${isAdmin ? AdminToken.getToken() : UserToken.getToken()}',
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

  static bool logout(Response<dynamic> response) {
    if (response.data['error'] != null &&
        response.data['error'].toString().toLowerCase().contains("token")) {
      AppToken.clearToken();
      AdminToken.clearToken();
      UserToken.clearToken();
      Get.offAllNamed(RoutePage.onBoarding);
      return true;
    }
    return false;
  }

  static void signout() {
    AppToken.clearToken();
    AdminToken.clearToken();
    UserToken.clearToken();
    Get.offAllNamed(RoutePage.onBoarding);
  }
}

Dio Api({bool? isFormData = false}) {
  final dio = Dio(); // With default `Options`.
  dio.options.baseUrl = BASE_URL;

  var header = ApiUtils.header();

  dio.options.headers.addAll(header);

  return dio;
}
