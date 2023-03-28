import 'package:get/get.dart';
import 'package:mobile/controller/profile/edit_profile_controller.dart';

class EditProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(EditProfileController());
  }
}
