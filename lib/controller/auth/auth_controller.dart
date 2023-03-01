import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
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
    // await client.then();
    // print(loginForm['username']!.text);

    await client.then((value) {
      value.login(
        username: loginForm['username']!.text,
        password: loginForm['username']!.text,
      );
    });

    // await client
    // final loginFormCopy =
    //     loginForm.map((key, value) => MapEntry(key, value.text));

    // print(loginFormCopy);
    // PostApiService.login(loginFormCopy);
  }
}
