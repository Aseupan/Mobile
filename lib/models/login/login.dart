import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/models/sources/model_factory.dart';

part 'login.g.dart';

@JsonSerializable()
class LoginModel implements ModelFactory {
  final String token;
  final String name;
  final String type;

  LoginModel({
    required this.token,
    required this.name,
    required this.type,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
