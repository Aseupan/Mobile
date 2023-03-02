import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/services/models/sources/base_response.dart';
import 'package:mobile/services/models/sources/model_factory.dart';

class ApiResponse<T> extends BaseResponse {
  final T? data;

  ApiResponse({
    this.data,
    required bool success,
    required String message,
  }) : super(success: success, message: message);

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return ApiResponse<T>(
      message: json['message'],
      success: json['success'],
      data: _Converter<T>().fromJson(json['data']),
    );
  }
}

// class ListApiResponse<T> extends BaseResponse {
//   final List<T> data;

//   ListApiResponse({
//     this.data = const [],
//     required bool success,
//     required String message,
//   }) : super(success: success, message: message);

//   factory ListApiResponse.fromJson(
//     Map<String, dynamic> json,
//   ) {
//     return ListApiResponse<T>(
//         message: json['message'],
//         success: json['success'],
//         data: List<T>.from((json['data']))
//             .map((e) => _Converter<T>().fromJson(e))
//             .toList());
//   }
// }

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
