import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/models/sources/model_factory.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel implements ModelFactory {
  String id;
  String name;
  String profile_picture;
  String phone;
  String email;
  String password;
  num point;
  String CreatedAt;
  String UpdatedAt;

  ProfileModel({
    required this.CreatedAt,
    required this.UpdatedAt,
    required this.email,
    required this.id,
    required this.name,
    required this.password,
    required this.phone,
    required this.point,
    required this.profile_picture,
  });

  ProfileModel.init({
    this.CreatedAt = "",
    this.UpdatedAt = "",
    this.email = "",
    this.id = "",
    this.name = "",
    this.password = "",
    this.phone = "",
    this.point = 0,
    this.profile_picture = "",
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}
