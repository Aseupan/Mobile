import 'dart:convert';

import 'package:get/get.dart' hide Response hide FormData hide MultipartFile;
import 'package:mobile/routes/app_routes.dart';
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

  static login(data) async {
    final api = Dio();

    try {
      Response request =
          await api.post("$BASE_URL/api/login", data: jsonEncode(data));

      ApiResponse<LoginModel> response = ApiResponse.fromJson(request.data);
      print(response.data!.token);
    } on DioError catch (e) {
      print(e.response);
    }
  }
}
