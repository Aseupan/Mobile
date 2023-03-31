import 'package:get/get.dart';

class MasakController extends GetxController {
  static MasakController get i => Get.find();

  RxMap<String, dynamic> data =
      <String, dynamic>{"pickup": 0, "additional_chips": []}.obs;
}

class MasakBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MasakController());
  }
}
