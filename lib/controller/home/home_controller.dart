import 'package:get/get.dart';
import 'package:mobile/models/home/information_card.dart';

class HomeController extends GetxController {
  static HomeController get i => Get.find();

  RxList<InformationCard> informations = <InformationCard>[].obs;
}
