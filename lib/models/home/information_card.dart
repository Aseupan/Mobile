import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/models/sources/model_factory.dart';

part 'information_card.g.dart';

@JsonSerializable()
class InformationCard implements ModelFactory {
  int id;
  String type;
  String title;
  String body;
  String thumbnail;
  String CreatedAt;

  InformationCard({
    required this.CreatedAt,
    required this.body,
    required this.id,
    required this.thumbnail,
    required this.title,
    required this.type,
  });

  factory InformationCard.fromJson(Map<String, dynamic> json) =>
      _$InformationCardFromJson(json);
  Map<String, dynamic> toJson() => _$InformationCardToJson(this);
}
