// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detect_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetectModel _$DetectModelFromJson(Map<String, dynamic> json) => DetectModel(
      labels:
          (json['labels'] as List<dynamic>).map((e) => e as String).toList(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$DetectModelToJson(DetectModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'labels': instance.labels,
    };
