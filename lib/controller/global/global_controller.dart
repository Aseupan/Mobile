import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:mobile/models/address/address_model.dart';
import 'package:mobile/models/campaign/campaign_model.dart';
import 'package:mobile/models/chips/chips_model.dart';
import 'package:mobile/models/profile/profile_model.dart';
import 'package:mobile/models/reward/redeem_reward_model.dart';
import 'package:mobile/services/api/api_utils.dart';

class GlobalController extends GetxController {
  static GlobalController get i => Get.find();

  Rx<ProfileModel> profile = ProfileModel.init().obs;

  RxList<ChipsModel> chips = <ChipsModel>[].obs;

  RxList<AddressModel> address = <AddressModel>[].obs;

  RxInt stateBar = 1.obs;

  RxList<RedeemRewardModel> redeems = <RedeemRewardModel>[].obs;

  RxBool isAdmin = false.obs;

  RxList<CampaignModel> campaigns = <CampaignModel>[].obs;

  RxList<dynamic> ongoingHistroy = <dynamic>[].obs;

  RxList<double> location = [1.0, 1.0].obs;

  Future<void> getCurrentLocation() async {
    try {
      // Check the current location permission status
      LocationPermission permission = await Geolocator.checkPermission();

      // If the user has granted location permission, get the current position and address
      if (permission == LocationPermission.always ||
          permission == LocationPermission.whileInUse) {
        Position current = await Geolocator.getCurrentPosition();
        location[0] = current.latitude;
        location[1] = current.longitude;
      }

      // If the user has not granted location permission, request it
      else {
        LocationPermission request = await Geolocator.requestPermission();
        if (request == LocationPermission.always ||
            request == LocationPermission.whileInUse) {
          Position current = await Geolocator.getCurrentPosition();
          location[0] = current.latitude;
          location[1] = current.longitude;
        }

        // Handle the case where the user denies the permission and does not allow the app to ask again
        else if (request == LocationPermission.denied) {
          ApiUtils.showAlert("Izin lokasi diblokir, mohon aktifkan");
          getCurrentLocation();
        } else if (request == LocationPermission.deniedForever) {
          await Geolocator.openLocationSettings();
        }
      }
    } catch (e) {
      ApiUtils.showAlert('Error getting location: $e');
    }
  }
}
