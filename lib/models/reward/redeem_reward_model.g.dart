// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'redeem_reward_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RedeemRewardModel _$RedeemRewardModelFromJson(Map<String, dynamic> json) =>
    RedeemRewardModel(
      id: json['id'] as num,
      name: json['name'] as String,
      points: json['points'] as num,
      quantity: json['quantity'] as num,
    );

Map<String, dynamic> _$RedeemRewardModelToJson(RedeemRewardModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'points': instance.points,
      'quantity': instance.quantity,
    };
