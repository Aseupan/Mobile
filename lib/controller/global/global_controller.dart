import 'package:get/get.dart';
import 'package:mobile/controller/global/address_model.dart';
import 'package:mobile/models/profile/profile_model.dart';
import 'package:mobile/models/reward/redeem_reward_model.dart';

class GlobalController extends GetxController {
  static GlobalController get i => Get.find();

  Rx<ProfileModel> profile = ProfileModel.init().obs;

  RxList<Address> address = <Address>[].obs;

  RxInt stateBar = 1.obs;

  RxList<RedeemRewardModel> redeems = <RedeemRewardModel>[].obs;
}
