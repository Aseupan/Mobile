class BaseResponse {
  bool success;
  String message;

  BaseResponse({
    required this.success,
    required this.message,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) => BaseResponse(
        success: json["success"],
        message: json["message"],
      );

  Map<dynamic, dynamic> toJson() => <String, dynamic>{
        'success': success,
        'message': message,
      };
}
