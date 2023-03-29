import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/models/sources/model_factory.dart';

part 'company_profile_model.g.dart';

@JsonSerializable()
class CompanyProfileModel implements ModelFactory {
  String id;
  String company_name;
  String company_picture;
  String company_address;
  String company_email;
  String company_phone;
  String password;
  num point;
  bool verified;
  String CreatedAt;
  String UpdatedAt;

  CompanyProfileModel(
      {required this.CreatedAt,
      required this.UpdatedAt,
      required this.company_address,
      required this.company_email,
      required this.company_name,
      required this.company_phone,
      required this.company_picture,
      required this.id,
      required this.password,
      required this.point,
      required this.verified});

  CompanyProfileModel.init({
    this.CreatedAt = "",
    this.UpdatedAt = "",
    this.company_address = "",
    this.company_email = "",
    this.company_name = "",
    this.company_phone = "",
    this.company_picture = "",
    this.id = "",
    this.password = "",
    this.point = 0,
    this.verified = false,
  });

  factory CompanyProfileModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyProfileModelFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyProfileModelToJson(this);
}
