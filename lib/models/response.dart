// ignore_for_file: annotate_overrides, overridden_fields

import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/models/sources/base_response.dart';
import 'package:mobile/models/sources/model_factory.dart';

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

class ApiResponses<T> extends BaseResponse {
  List<T>? data;
  String? error;

  ApiResponses({
    this.data = const [],
    required bool success,
    required String message,
    this.error,
  }) : super(success: success, message: message, error: error);

  factory ApiResponses.fromJson(Map<String, dynamic> json) => ApiResponses<T>(
        message: json['message'],
        success: json['success'],
        data: List<T>.from((json["results"] ?? json["data"])
            .map((x) => _Converter<T?>().fromJson(x))),
        error: json['error'],
      );
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
