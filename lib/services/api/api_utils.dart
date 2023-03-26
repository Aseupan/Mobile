import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile/services/api/app_token.dart';

class ApiUtils {
  static Map<String, dynamic> header({bool? isAdmin = false}) {
    return {
      'Accept': 'application/json',
      'Content-type': 'application/json',
      "Authorization":
          'Bearer ${isAdmin! ? AdminToken.getToken() : UserToken.getToken()}',
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
}
