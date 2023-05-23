// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:mobile/controller/campaign/types/food_detail.dart';
import 'package:get/get.dart' hide Response hide FormData hide MultipartFile;
import 'package:mobile/controller/global/global_controller.dart';
import 'package:mobile/models/campaign/campaign_model.dart';
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
    "latitude": 0,
    "longitude": 0,
  }.obs;

  Future<bool> checkPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }

  void pickLocation() {
    GlobalController globalController = GlobalController.i;
    Get.to(
      PlacePicker(
        apiKey: "AIzaSyCYaqABDWiWv9p7FwlKURVmHfzHKbkXak0",
        onPlacePicked: (result) {
          data['latitude'] = result.geometry?.location.lat;
          data['longitude'] = result.geometry?.location.lng;
          String address = "";
          result.addressComponents?.forEach((element) {
            address += ("${element.shortName}, ");
          });

          data['area'].text = address;
          print(data);

          Get.back();
        },
        initialPosition: LatLng(
          globalController.location[0],
          globalController.location[1],
        ),
        useCurrentLocation: true,
        resizeToAvoidBottomInset:
            false, // only works in page mode, less flickery, remove if wrong offsets
      ),
    );
  }

  var createCampaignAddress = TextEditingController();

  var baseCateringForm = <String, dynamic>{
    "name": TextEditingController(),
    "phone": TextEditingController(),
    "address": TextEditingController(),
    "addressDetail": TextEditingController(),
    "issave": false,
  };

  RxMap<String, dynamic> cateringForm = <String, dynamic>{
    "name": TextEditingController(),
    "phone": TextEditingController(),
    "address": TextEditingController(),
    "addressDetail": TextEditingController(),
    "issave": false,
  }.obs;

  RxMap<String, CampaignModel> campaignDetail = <String, CampaignModel>{}.obs;
  RxMap<String, List<String>> thumbnailById = <String, List<String>>{}.obs;

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
      "latitude": data["latitude"],
      "longitude": data["longitude"],
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
