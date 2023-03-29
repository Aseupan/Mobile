import 'package:get/get.dart';
import 'package:mobile/controller/chips/chips_controller.dart';

class ChipsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ChipsController());
  }
}
