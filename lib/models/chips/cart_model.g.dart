// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartModel _$CartModelFromJson(Map<String, dynamic> json) => CartModel(
      User: ProfileModel.fromJson(json['User'] as Map<String, dynamic>),
      company_id: json['company_id'] as String,
      credit_store_id: json['credit_store_id'] as num,
      points: json['points'] as num,
      price: json['price'] as num,
      quantity: json['quantity'] as num,
      user_id: json['user_id'] as String,
    );

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
      'User': instance.User,
      'user_id': instance.user_id,
      'company_id': instance.company_id,
      'credit_store_id': instance.credit_store_id,
      'points': instance.points,
      'price': instance.price,
      'quantity': instance.quantity,
    };
