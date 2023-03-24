import 'package:get/get.dart';
import 'package:mobile/controller/global/address_model.dart';

class GlobalController extends GetxController {
  static GlobalController get i => Get.find();

  RxList<Address> address = <Address>[].obs;

  RxInt stateBar = 1.obs;
}
