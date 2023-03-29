import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/models/profile/profile_model.dart';

part 'cart_model.g.dart';

@JsonSerializable()
class CartModel {
  ProfileModel User;
  String user_id;
  String company_id;
  num credit_store_id;
  num points;
  num price;
  num quantity;

  CartModel({
    required this.User,
    required this.company_id,
    required this.credit_store_id,
    required this.points,
    required this.price,
    required this.quantity,
    required this.user_id,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);
  Map<String, dynamic> toJson() => _$CartModelToJson(this);
}
