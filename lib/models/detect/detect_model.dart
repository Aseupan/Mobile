import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/models/sources/model_factory.dart';

part 'detect_model.g.dart';

@JsonSerializable()
class DetectModel implements ModelFactory {
  String name;
  List<String> labels;

  DetectModel({
    required this.labels,
    required this.name,
  });

  factory DetectModel.fromJson(Map<String, dynamic> json) =>
      _$DetectModelFromJson(json);
  Map<String, dynamic> toJson() => _$DetectModelToJson(this);
}
