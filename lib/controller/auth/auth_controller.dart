import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mobile/services/api/post_api_service.dart';
import 'package:mobile/services/models/sources/api/api_services.dart';

class AuthController extends GetxController {
  RxMap<String, TextEditingController> loginForm = {
    "username": TextEditingController(),
    "password": TextEditingController(),
  }.obs;

  RxMap<String, TextEditingController> registerForm = {
    "username": TextEditingController(),
    "password": TextEditingController(),
    "confirmPassword": TextEditingController(),
    "email": TextEditingController(),
  }.obs;

  void login() async {
    final loginFormCopy =
        loginForm.map((key, value) => MapEntry(key, value.text));

    final data = await PostApiService.login(loginFormCopy);
    print(data.message);
    // print(data.token);
  }
}
