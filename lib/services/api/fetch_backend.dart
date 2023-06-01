import 'package:dio/dio.dart';
import 'package:mobile/models/response.dart';
import 'package:mobile/services/api/api_utils.dart';
import 'package:mobile/services/api/request_method.dart';

Future<ApiResponse<T>?> fetchBackend<T>({
  required String url,
  required RequestMethod method,
  Object? data,
  bool? isAlert = true,
  Map<String, String>? header,
  bool isAdmin = false,
}) async {
  try {
    final api = Api();

    Response request = await api.request(url,
        data: data, options: Options(method: method.value));

    if (T == dynamic) {
      return request.data;
    }

    ApiResponse<T> response = ApiResponse.fromJson(request.data);
    return response;
  } on DioError catch (e) {
    if (e.response != null) {
      final response = e.response!;
      if (!ApiUtils.logout(response)) {
        ApiUtils.showAlert(response.data['error'] ?? e.toString());
      }
    } else {
      ApiUtils.showAlert(e.message ?? e.error.toString());
    }
    return null;
  }
}

Future<ApiResponses<T>?> fetchMultipleBackend<T>({
  required String url,
  required RequestMethod method,
  Object? data,
  bool? isAlert = true,
}) async {
  try {
    final api = Api();
    Response request = await api.request(url,
        data: data, options: Options(method: method.value));

    if (T == dynamic) {
      return request.data;
    }

    ApiResponses<T> response = ApiResponses.fromJson(request.data);
    return response;
  } on DioError catch (e) {
    if (e.response != null) {
      final response = e.response!;
      if (!ApiUtils.logout(response)) {
        ApiUtils.showAlert(response.data['error'] ?? e.toString());
      }
    } else {
      ApiUtils.showAlert(e.message ?? e.error.toString());
    }
    return null;
  }
}
