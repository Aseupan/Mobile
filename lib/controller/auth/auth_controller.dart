import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mobile/services/api/post_api_service.dart';

class AuthController extends GetxController {
  RxMap<String, TextEditingController> loginForm = {
    "email": TextEditingController(),
    "password": TextEditingController(),
  }.obs;

  RxMap<String, TextEditingController> registerForm = {
    "name": TextEditingController(),
    "username": TextEditingController(),
    "email": TextEditingController(),
    "password": TextEditingController(),
  }.obs;

  RxMap<String, TextEditingController> registerBigpartyForm =
      <String, TextEditingController>{
    "name": TextEditingController(),
    "email": TextEditingController(),
    "address": TextEditingController(),
    "password": TextEditingController(),
    "confirmPassword": TextEditingController(),
  }.obs;

  void login() async {
    final loginFormCopy =
        loginForm.map((key, value) => MapEntry(key, value.text));

    final data = await PostApiService.login(loginFormCopy);
  }

  void register() async {
    print('asdasdasd');
    final registerFormCopy =
        registerForm.map((key, value) => MapEntry(key, value.text));

    PostApiService.register(registerFormCopy);
  }
}
