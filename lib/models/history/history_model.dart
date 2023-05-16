import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/models/sources/model_factory.dart';

part 'history_model.g.dart';

@JsonSerializable()
class HistoryModel implements ModelFactory {
  int id;
  String user_id;
  String company_id;
  String title;
  int category;
  String CreatedAt;

  HistoryModel({
    required this.CreatedAt,
    required this.category,
    required this.company_id,
    required this.id,
    required this.title,
    required this.user_id,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$HistoryModelToJson(this);
}
