import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/services/models/sources/base_response.dart';
import 'package:mobile/services/models/sources/model_factory.dart';

class ApiResponse<T> extends BaseResponse {
  final T? data;
  String? error;

  ApiResponse({
    this.data,
    required bool success,
    required String message,
    this.error,
  }) : super(success: success, message: message, error: error);

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return ApiResponse<T>(
      message: json['message'],
      success: json['success'],
      data: _Converter<T>().fromJson(json['data']),
      error: json['error'],
    );
  }
}

class _Converter<T> implements JsonConverter<T?, Object?> {
  const _Converter();

  @override
  T? fromJson(Object? json) {
    if (json is Map<String, dynamic>) {
      return ModelFactory.fromJson(T, json) as T;
    }
    return json as T;
  }

  @override
  Object toJson(T? object) {
    return (object as Object);
  }
}
