import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/models/chips/cart_model.dart';
import 'package:mobile/models/sources/model_factory.dart';

part 'cart_response_model.g.dart';

@JsonSerializable()
class CartResponseModel implements ModelFactory {
  List<CartModel> cart;
  int total;
  int totalPoints;

  CartResponseModel({
    required this.cart,
    required this.total,
    required this.totalPoints,
  });

  factory CartResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CartResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$CartResponseModelToJson(this);
}
