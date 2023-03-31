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
    "email": TextEditingController(),
    "password": TextEditingController(),
    "confirm_password": TextEditingController(),
  }.obs;

  RxMap<String, TextEditingController> registerBigpartyForm =
      <String, TextEditingController>{
    "company_name": TextEditingController(),
    "company_address": TextEditingController(),
    "company_email": TextEditingController(),
    "password": TextEditingController(),
    "confirm_password": TextEditingController(),
  }.obs;

  void login() async {
    final loginFormCopy =
        loginForm.map((key, value) => MapEntry(key, value.text));

    PostApiService.login(loginFormCopy);
  }

  void register() async {
    final registerFormCopy =
        registerForm.map((key, value) => MapEntry(key, value.text));

    PostApiService.register(registerFormCopy);
  }

  void registerCompany() {
    final registerFormCopy =
        registerBigpartyForm.map((key, value) => MapEntry(key, value.text));

    PostApiService.registerCompany(registerFormCopy);
  }
}
