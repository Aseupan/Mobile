import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/controller/global/company_controller.dart';
import 'package:mobile/controller/global/global_controller.dart';
import 'package:mobile/services/api/post_api_service.dart';

class EditProfile {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
}

class EditProfileController extends GetxController {
  static EditProfileController get i => Get.find();

  RxMap<String, TextEditingController> data = <String, TextEditingController>{
    "name": TextEditingController(),
    "email": TextEditingController(),
    "phone": TextEditingController(),
    "company_name": TextEditingController(),
    "company_email": TextEditingController(),
    "company_phone": TextEditingController(),
  }.obs;

  RxString profile_picture = "".obs;

  RxBool isEdited = false.obs;

  @override
  void onInit() {
    super.onInit();
    GlobalController globalController = GlobalController.i;
    bool isCompany = globalController.isAdmin.value;
    if (isCompany) {
      CompanyController companyController = CompanyController.i;
      data['company_name']!.text = companyController.profile.value.company_name;
      data['company_email']!.text =
          companyController.profile.value.company_email;
      data['company_phone']!.text =
          companyController.profile.value.company_phone;
      profile_picture.value = companyController.profile.value.company_picture;
    } else {
      data['name']!.text = globalController.profile.value.name;
      data['email']!.text = globalController.profile.value.email;
      data['phone']!.text = globalController.profile.value.phone;
      profile_picture.value = globalController.profile.value.profile_picture;
    }
  }

  void editProfile() {
    GlobalController globalController = GlobalController.i;
    bool isCompany = globalController.isAdmin.value;
    if (isCompany) {
      final formCopy = data.map((key, value) => MapEntry(key, value.text));
      Map<String, String> editFormCopy = {
        'company_name': formCopy['company_name']!,
        'company_email': formCopy['company_email']!,
        'company_phone': formCopy['company_phone']!,
      };

      PostApiService.updateProfile(editFormCopy);
    } else {
      final formCopy = data.map((key, value) => MapEntry(key, value.text));
      Map<String, String> editFormCopy = {
        'name': formCopy['name']!,
        'email': formCopy['email']!,
        'phone': formCopy['phone']!,
      };

      PostApiService.updateProfile(editFormCopy);
    }
  }
}
