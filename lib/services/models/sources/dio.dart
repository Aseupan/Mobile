import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mobile/services/api/user_token.dart';
// import 'log_interceptor.dart';

class AppDio {
  Future<Dio> getDIO({
    Map<String, dynamic> headers = const {},
    Duration? connectTimeout,
    Duration? receiveTimeout,
    bool? isAuthenticated = false,
  }) async {
    var dio = Dio(BaseOptions(
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      contentType: "application/json",
    ));

    final defaultHeaders = Map<String, dynamic>();

    // defaultHeaders.addIf(
    //     isAuthenticated, "Authorization", UserToken.getToken());
    defaultHeaders.addAll({
      "Accept": "application/json",
      "Content-Type": "application/json",
    });

    // // override headers if needed
    defaultHeaders.addAll(headers);

    // // apply new headers
    dio.options.headers.addAll(defaultHeaders);
    // dio.interceptors.add(LogInterceptor(responseBody: true));
    // dio.interceptors.add(APILogInterceptor());
    return dio;
  }
}
