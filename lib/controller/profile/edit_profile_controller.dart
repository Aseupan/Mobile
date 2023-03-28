import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  }.obs;

  RxString profile_picture = "".obs;

  RxBool isEdited = false.obs;

  @override
  void onInit() {
    super.onInit();
    GlobalController globalController = GlobalController.i;
    data['name']!.text = globalController.profile.value.name;
    data['email']!.text = globalController.profile.value.email;
    data['phone']!.text = globalController.profile.value.phone;
    profile_picture.value = globalController.profile.value.profile_picture;
  }

  void editProfile() {
    final editFormCopy = data.map((key, value) => MapEntry(key, value.text));

    PostApiService.updateProfile(editFormCopy);
  }
}
