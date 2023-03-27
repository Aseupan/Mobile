import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/models/sources/model_factory.dart';

part 'redeem_reward_model.g.dart';

@JsonSerializable()
class RedeemRewardModel implements ModelFactory {
  num id;
  String name;
  num points;
  num quantity;

  RedeemRewardModel({
    required this.id,
    required this.name,
    required this.points,
    required this.quantity,
  });

  factory RedeemRewardModel.fromJson(Map<String, dynamic> json) =>
      _$RedeemRewardModelFromJson(json);
  Map<String, dynamic> toJson() => _$RedeemRewardModelToJson(this);
}
