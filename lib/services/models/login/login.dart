import 'package:mobile/services/models/sources/model_factory.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login.g.dart';

@JsonSerializable()
class LoginModel implements ModelFactory {
  final String token;
  final String username;

  LoginModel({
    required this.token,
    required this.username,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
