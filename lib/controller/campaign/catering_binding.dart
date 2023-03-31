import 'package:get/get.dart';
import 'package:mobile/controller/campaign/catering_controller.dart';

class CateringBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CateringController());
  }
}
