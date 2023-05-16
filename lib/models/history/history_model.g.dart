// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryModel _$HistoryModelFromJson(Map<String, dynamic> json) => HistoryModel(
      CreatedAt: json['CreatedAt'] as String,
      category: json['category'] as int,
      company_id: json['company_id'] as String,
      id: json['id'] as int,
      title: json['title'] as String,
      user_id: json['user_id'] as String,
    );

Map<String, dynamic> _$HistoryModelToJson(HistoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'company_id': instance.company_id,
      'title': instance.title,
      'category': instance.category,
      'CreatedAt': instance.CreatedAt,
    };
