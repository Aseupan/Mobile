import 'package:get/get.dart';
import 'package:mobile/controller/auth/auth_controller.dart';
import 'package:mobile/controller/campaign/campaign_controller.dart';

class CampaignBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CampaignController());
  }
}
