import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/models/sources/model_factory.dart';

part 'campaign_model.g.dart';

@JsonSerializable()
class CampaignModel implements ModelFactory {
  int id = 0;
  String company_id = "";
  String name = "";
  String description = "";
  int progress = 0;
  int target = 0;
  String area = "";
  String? start_date;
  String? end_date;
  String thumbnail_1 = "";
  String thumbnail_2 = "";
  String thumbnail_3 = "";
  String thumbnail_4 = "";
  String thumbnail_5 = "";
  int urgent = 0;
  List<String>? type;
  double latitude = 0;
  double longitude = 0;
  double distance = 0;

  CampaignModel({
    required this.area,
    required this.company_id,
    required this.description,
    required this.end_date,
    required this.id,
    required this.name,
    required this.progress,
    required this.start_date,
    required this.target,
    required this.thumbnail_1,
    required this.thumbnail_2,
    required this.thumbnail_3,
    required this.thumbnail_4,
    required this.thumbnail_5,
    required this.type,
    required this.urgent,
    required this.distance,
    required this.latitude,
    required this.longitude,
  });

  CampaignModel.init();

  factory CampaignModel.fromJson(Map<String, dynamic> json) =>
      _$CampaignModelFromJson(json);
  Map<String, dynamic> toJson() => _$CampaignModelToJson(this);
}
