// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catering_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CateringModel _$CateringModelFromJson(Map<String, dynamic> json) =>
    CateringModel(
      CreatedAt: json['CreatedAt'] as String,
      User: ProfileModel.fromJson(json['User'] as Map<String, dynamic>),
      address: json['address'] as String,
      address_detailed: json['address_detailed'] as String,
      id: json['id'] as int,
      is_saved: json['is_saved'] as bool,
      name: json['name'] as String,
      phone: json['phone'] as String,
      user_id: json['user_id'] as String,
    );

Map<String, dynamic> _$CateringModelToJson(CateringModel instance) =>
    <String, dynamic>{
      'User': instance.User,
      'user_id': instance.user_id,
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
      'address_detailed': instance.address_detailed,
      'is_saved': instance.is_saved,
      'CreatedAt': instance.CreatedAt,
    };
