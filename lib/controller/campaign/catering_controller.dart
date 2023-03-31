import 'package:get/get.dart';
import 'package:mobile/models/catering/catering_model.dart';

class CateringController extends GetxController {
  static CateringController get i => Get.find();

  RxInt cateringId = (-999).obs;
  RxList<CateringModel> caterings = <CateringModel>[].obs;
}
