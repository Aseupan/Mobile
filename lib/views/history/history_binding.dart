import 'package:get/get.dart';
import 'package:mobile/controller/history/history_controller.dart';

class HistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HistoryController());
  }
}
