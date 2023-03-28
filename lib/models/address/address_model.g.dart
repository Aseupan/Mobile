// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) => AddressModel(
      CreatedAt: json['CreatedAt'] as String,
      UpdatedAt: json['UpdatedAt'] as String,
      address: json['address'] as String,
      city: json['city'] as String,
      company_id: json['company_id'] as String,
      detailed_address: json['detailed_address'] as String,
      disctrict: json['disctrict'] as String,
      id: json['id'] as num,
      index: json['index'] as num,
      name: json['name'] as String,
      phone: json['phone'] as String,
      primary_address: json['primary_address'] as bool,
      state: json['state'] as String,
      user_id: json['user_id'] as String,
      zip_code: json['zip_code'] as String,
    );

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'company_id': instance.company_id,
      'index': instance.index,
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
      'state': instance.state,
      'city': instance.city,
      'disctrict': instance.disctrict,
      'zip_code': instance.zip_code,
      'detailed_address': instance.detailed_address,
      'primary_address': instance.primary_address,
      'CreatedAt': instance.CreatedAt,
      'UpdatedAt': instance.UpdatedAt,
    };
