import 'package:get/get.dart';
import 'package:mobile/models/profile/company_profile_model.dart';

class CompanyController extends GetxController {
  static CompanyController get i => Get.find();

  Rx<CompanyProfileModel> profile = CompanyProfileModel.init().obs;
}
