import 'package:get/get.dart';
import 'package:mobile/models/address/address_model.dart';
import 'package:mobile/models/chips/chips_model.dart';
import 'package:mobile/models/profile/company_profile_model.dart';
import 'package:mobile/models/profile/profile_model.dart';
import 'package:mobile/models/reward/redeem_reward_model.dart';

class GlobalController extends GetxController {
  static GlobalController get i => Get.find();

  Rx<ProfileModel> profile = ProfileModel.init().obs;

  RxList<ChipsModel> chips = <ChipsModel>[].obs;

  RxList<AddressModel> address = <AddressModel>[].obs;

  RxInt stateBar = 1.obs;

  RxList<RedeemRewardModel> redeems = <RedeemRewardModel>[].obs;
  RxBool isAdmin = false.obs;
}
