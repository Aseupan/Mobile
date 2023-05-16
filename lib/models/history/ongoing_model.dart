import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/models/campaign/campaign_model.dart';
import 'package:mobile/models/sources/model_factory.dart';

part 'ongoing_model.g.dart';

@JsonSerializable()
class OngoingModel implements ModelFactory {
  int id;
  String user_id;

  @JsonKey(name: "Campaign")
  CampaignModel campaign;
  int campaign_id;
  String food_type;
  String description;
  int quantity;
  int weight;
  String expired_date;
  int pickup;
  List<int>? additional_chips;
  int chip_acquisition;
  bool is_done;

  @JsonKey(name: "CreatedAt")
  String created_at;

  @JsonKey(name: "UpdatedAt")
  String updated_at;

  OngoingModel({
    required this.additional_chips,
    required this.campaign,
    required this.campaign_id,
    required this.chip_acquisition,
    required this.created_at,
    required this.description,
    required this.expired_date,
    required this.food_type,
    required this.id,
    required this.is_done,
    required this.pickup,
    required this.quantity,
    required this.updated_at,
    required this.user_id,
    required this.weight,
  });

  factory OngoingModel.fromJson(Map<String, dynamic> json) =>
      _$OngoingModelFromJson(json);
  Map<String, dynamic> toJson() => _$OngoingModelToJson(this);
}
