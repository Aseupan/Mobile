import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/models/profile/profile_model.dart';
import 'package:mobile/models/sources/model_factory.dart';

part 'catering_model.g.dart';

@JsonSerializable()
class CateringModel implements ModelFactory {
  ProfileModel User;
  String user_id;
  int id;
  String name;
  String phone;
  String address;
  String address_detailed;
  bool is_saved;
  String CreatedAt;

  CateringModel({
    required this.CreatedAt,
    required this.User,
    required this.address,
    required this.address_detailed,
    required this.id,
    required this.is_saved,
    required this.name,
    required this.phone,
    required this.user_id,
  });

  factory CateringModel.fromJson(Map<String, dynamic> json) =>
      _$CateringModelFromJson(json);
  Map<String, dynamic> toJson() => _$CateringModelToJson(this);
}
