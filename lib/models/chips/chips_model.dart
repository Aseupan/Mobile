import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/models/sources/model_factory.dart';

part 'chips_model.g.dart';

@JsonSerializable()
class ChipsModel implements ModelFactory {
  num id;
  num points;
  num price;

  ChipsModel({
    required this.id,
    required this.points,
    required this.price,
  });

  factory ChipsModel.fromJson(Map<String, dynamic> json) =>
      _$ChipsModelFromJson(json);
  Map<String, dynamic> toJson() => _$ChipsModelToJson(this);
}
