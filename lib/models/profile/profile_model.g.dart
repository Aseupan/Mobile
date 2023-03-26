// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
      CreatedAt: json['CreatedAt'] as String,
      UpdatedAt: json['UpdatedAt'] as String,
      email: json['email'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      password: json['password'] as String,
      phone: json['phone'] as String,
      point: json['point'] as num,
      profile_picture: json['profile_picture'] as String,
    );

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profile_picture': instance.profile_picture,
      'phone': instance.phone,
      'email': instance.email,
      'password': instance.password,
      'point': instance.point,
      'CreatedAt': instance.CreatedAt,
      'UpdatedAt': instance.UpdatedAt,
    };
