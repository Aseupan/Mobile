import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mobile/models/history/history_model.dart';
import 'package:mobile/models/history/ongoing_model.dart';
import 'package:mobile/services/api/fetch_data.dart';
import 'package:mobile/services/api/request_method.dart';

class HistoryController extends GetxController {
  static HistoryController get i => Get.find();

  RxBool isDone = false.obs;

  RxBool isLoadingOngoing = true.obs;
  RxBool isLoadingDone = true.obs;

  RxList<OngoingModel> ongoing = <OngoingModel>[].obs;
  RxList<HistoryModel> done = <HistoryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    isLoadingOngoing.value = true;
    isLoadingDone.value = true;
    getOngoingData();
    getDoneData();
  }

  void getOngoingData() async {
    var response = await fetchMultipleData<OngoingModel>(
        url: "/api/history/ongoing", method: RequestMethod.GET);

    if (response != null) {
      ongoing.value = response.data!;
    }

    isLoadingOngoing.value = false;
  }

  void getLocation() {
    var api = Dio();
  }

  void getDoneData() async {
    var response = await fetchMultipleData<HistoryModel>(
        url: "/api/history/completed", method: RequestMethod.GET);

    if (response != null) {
      done.value = response.data!;
    }

    isLoadingDone.value = false;
  }
}
