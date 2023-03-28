import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/models/sources/model_factory.dart';

part 'address_model.g.dart';

@JsonSerializable()
class AddressModel implements ModelFactory {
  num id = 0;
  String user_id = "";
  String company_id = "";
  num index = 0;
  String name = "";
  String phone = "";
  String address = "";
  String state = "";
  String city = "";
  String disctrict = "";
  String zip_code = "";
  String detailed_address = "";
  bool primary_address = false;
  String CreatedAt = "";
  String UpdatedAt = "";

  AddressModel({
    required this.CreatedAt,
    required this.UpdatedAt,
    required this.address,
    required this.city,
    required this.company_id,
    required this.detailed_address,
    required this.disctrict,
    required this.id,
    required this.index,
    required this.name,
    required this.phone,
    required this.primary_address,
    required this.state,
    required this.user_id,
    required this.zip_code,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}
