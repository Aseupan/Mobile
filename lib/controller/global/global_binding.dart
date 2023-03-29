import 'package:get/get.dart';
import 'package:mobile/controller/global/company_controller.dart';
import 'package:mobile/controller/global/global_controller.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GlobalController());
    Get.put(CompanyController());
  }
}
