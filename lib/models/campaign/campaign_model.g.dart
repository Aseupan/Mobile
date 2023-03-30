// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CampaignModel _$CampaignModelFromJson(Map<String, dynamic> json) =>
    CampaignModel(
      area: json['area'] as String,
      company_id: json['company_id'] as String,
      description: json['description'] as String,
      end_date: json['end_date'] as String,
      id: json['id'] as int,
      name: json['name'] as String,
      progress: json['progress'] as int,
      start_date: json['start_date'] as String,
      target: json['target'] as int,
      thumbnail_1: json['thumbnail_1'] as String,
      thumbnail_2: json['thumbnail_2'] as String,
      thumbnail_3: json['thumbnail_3'] as String,
      thumbnail_4: json['thumbnail_4'] as String,
      thumbnail_5: json['thumbnail_5'] as String,
      type: (json['type'] as List<dynamic>?)?.map((e) => e as String).toList(),
      urgent: json['urgent'] as int,
    );

Map<String, dynamic> _$CampaignModelToJson(CampaignModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'company_id': instance.company_id,
      'name': instance.name,
      'description': instance.description,
      'progress': instance.progress,
      'target': instance.target,
      'area': instance.area,
      'start_date': instance.start_date,
      'end_date': instance.end_date,
      'thumbnail_1': instance.thumbnail_1,
      'thumbnail_2': instance.thumbnail_2,
      'thumbnail_3': instance.thumbnail_3,
      'thumbnail_4': instance.thumbnail_4,
      'thumbnail_5': instance.thumbnail_5,
      'urgent': instance.urgent,
      'type': instance.type,
    };
