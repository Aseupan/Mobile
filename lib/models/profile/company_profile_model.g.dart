// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyProfileModel _$CompanyProfileModelFromJson(Map<String, dynamic> json) =>
    CompanyProfileModel(
      CreatedAt: json['CreatedAt'] as String,
      UpdatedAt: json['UpdatedAt'] as String,
      company_address: json['company_address'] as String,
      company_email: json['company_email'] as String,
      company_name: json['company_name'] as String,
      company_phone: json['company_phone'] as String,
      company_picture: json['company_picture'] as String,
      id: json['id'] as String,
      password: json['password'] as String,
      point: json['point'] as num,
      verified: json['verified'] as bool,
    );

Map<String, dynamic> _$CompanyProfileModelToJson(
        CompanyProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'company_name': instance.company_name,
      'company_picture': instance.company_picture,
      'company_address': instance.company_address,
      'company_email': instance.company_email,
      'company_phone': instance.company_phone,
      'password': instance.password,
      'point': instance.point,
      'verified': instance.verified,
      'CreatedAt': instance.CreatedAt,
      'UpdatedAt': instance.UpdatedAt,
    };
