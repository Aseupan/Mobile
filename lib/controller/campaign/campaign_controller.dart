import 'package:get/get.dart';

class FoodDetail {
  var foodType = "".obs;
  var description = "".obs;
  RxInt quantity = 1.obs;
  RxInt weight = 1.obs;
  var expired = "".obs;
  RxBool isValid = false.obs;

  void checkValid() {
    if (foodType.isEmpty || description.isEmpty || expired.isEmpty) {
      isValid.value = false;
    } else {
      isValid.value = true;
    }
  }
}

class PickupDetail {
  RxBool isSpecial = false.obs;
  RxBool isAdditional = false.obs;
  RxBool isGift = false.obs;
  RxBool isAggree = false.obs;
}

class CampaignController extends GetxController {
  static CampaignController get i => Get.find();

  var foodDetails = <String, FoodDetail>{}.obs;
  // Rx<PickupDetail> pickupState = PickupDetail().obs;

  RxMap<String, PickupDetail> pickupState = <String, PickupDetail>{}.obs;
}
