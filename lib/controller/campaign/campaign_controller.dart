import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/controller/campaign/types/create_campaign.dart';
import 'package:mobile/controller/campaign/types/food_detail.dart';

class PickupDetail {
  RxBool isSpecial = false.obs;
  RxBool isAdditional = false.obs;
  RxBool isGift = false.obs;
  RxBool isAggree = false.obs;
}

class CampaignController extends GetxController {
  static CampaignController get i => Get.find();

  var foodDetails = <String, FoodDetail>{}.obs;

  RxMap<String, PickupDetail> pickupState = <String, PickupDetail>{}.obs;

  Rx<CreateCampaign> createCampaign = CreateCampaign().obs;
}
