class BaseResponse {
  bool success;
  String message;
  String? error;

  BaseResponse({required this.success, required this.message, this.error});

  factory BaseResponse.fromJson(Map<String, dynamic> json) => BaseResponse(
        success: json["success"],
        message: json["message"],
        error: json['error'],
      );

  Map<dynamic, dynamic> toJson() => <String, dynamic>{
        'success': success,
        'message': message,
        'error': error,
      };
}
