// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ongoing_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OngoingModel _$OngoingModelFromJson(Map<String, dynamic> json) => OngoingModel(
      additional_chips: (json['additional_chips'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      campaign:
          CampaignModel.fromJson(json['Campaign'] as Map<String, dynamic>),
      campaign_id: json['campaign_id'] as int,
      chip_acquisition: json['chip_acquisition'] as int,
      created_at: json['CreatedAt'] as String,
      description: json['description'] as String,
      expired_date: json['expired_date'] as String,
      food_type: json['food_type'] as String,
      id: json['id'] as int,
      is_done: json['is_done'] as bool,
      pickup: json['pickup'] as int,
      quantity: json['quantity'] as int,
      updated_at: json['UpdatedAt'] as String,
      user_id: json['user_id'] as String,
      weight: json['weight'] as int,
    );

Map<String, dynamic> _$OngoingModelToJson(OngoingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'Campaign': instance.campaign,
      'campaign_id': instance.campaign_id,
      'food_type': instance.food_type,
      'description': instance.description,
      'quantity': instance.quantity,
      'weight': instance.weight,
      'expired_date': instance.expired_date,
      'pickup': instance.pickup,
      'additional_chips': instance.additional_chips,
      'chip_acquisition': instance.chip_acquisition,
      'is_done': instance.is_done,
      'CreatedAt': instance.created_at,
      'UpdatedAt': instance.updated_at,
    };
