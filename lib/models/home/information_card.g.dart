// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'information_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InformationCard _$InformationCardFromJson(Map<String, dynamic> json) =>
    InformationCard(
      CreatedAt: json['CreatedAt'] as String,
      body: json['body'] as String,
      id: json['id'] as int,
      thumbnail: json['thumbnail'] as String,
      title: json['title'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$InformationCardToJson(InformationCard instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'body': instance.body,
      'thumbnail': instance.thumbnail,
      'CreatedAt': instance.CreatedAt,
    };
