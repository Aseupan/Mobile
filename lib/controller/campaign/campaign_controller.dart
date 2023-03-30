// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobile/controller/campaign/types/food_detail.dart';
import 'package:get/get.dart' hide Response hide FormData hide MultipartFile;
import 'package:mobile/services/api/post_api_service.dart';

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

  RxMap<String, dynamic> data = <String, dynamic>{
    "name": TextEditingController(),
    "description": TextEditingController(),
    "target": 10,
    "area": TextEditingController(),
    "type": [],
    "startdate": TextEditingController(),
    "enddate": TextEditingController(),
    "urgent": 0,
    "thumbnail1": "",
    "thumbnail2": "",
    "thumbnail3": "",
    "thumbnail4": "",
    "thumbnail5": "",
  }.obs;

  void createCampaign(BuildContext context) async {
    FormData formData = FormData.fromMap({
      "name": data['name'].text,
      "description": data['description'].text,
      "target": data['target'],
      "area": data['area'].text,
      "startdate": data['startdate'].text,
      "enddate": data['enddate'].text,
      "urgent": data['urgent'],
      "type[]": data['type'],
      "thumbnail1": data['thumbnail1'] == ""
          ? ""
          : await MultipartFile.fromFile(data['thumbnail1']),
      "thumbnail2": data['thumbnail2'] == ""
          ? ""
          : await MultipartFile.fromFile(data['thumbnail2']),
      "thumbnail3": data['thumbnail3'] == ""
          ? ""
          : await MultipartFile.fromFile(data['thumbnail3']),
      "thumbnail4": data['thumbnail4'] == ""
          ? ""
          : await MultipartFile.fromFile(data['thumbnail4']),
      "thumbnail5": data['thumbnail5'] == ""
          ? ""
          : await MultipartFile.fromFile(data['thumbnail5']),
    });

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: SizedBox(
              height: 200,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 15),
                    Text('Creating campaign ...')
                  ],
                ),
              ),
            ),
          );
        });

    PostApiService.createCampaign(formData);
  }
}
