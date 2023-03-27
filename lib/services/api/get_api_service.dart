import 'package:dio/dio.dart';
import 'package:mobile/controller/global/global_controller.dart';
import 'package:mobile/controller/home/home_controller.dart';
import 'package:mobile/models/home/information_card.dart';
import 'package:mobile/models/profile/profile_model.dart';
import 'package:mobile/models/response.dart';
import 'package:mobile/models/reward/redeem_reward_model.dart';
import 'package:mobile/services/api/api_utils.dart';
import 'package:mobile/services/api/base_url.dart';

class GetApiService {
  static void getInformations() async {
    final api = Dio();
    // api.options.headers = ApiUtils.header();

    try {
      Response request = await api.get(
        "$BASE_URL/api/info/all-info",
        options: Options(
          followRedirects: false,
          headers: ApiUtils.header(),
        ),
      );

      ApiResponses<InformationCard> response =
          ApiResponses.fromJson(request.data);

      var controller = HomeController.i;
      controller.informations.value = response.data!;
    } on DioError catch (e) {
      if (e.response != null) {
        final response = e.response!;
        ApiUtils.showAlert(response.data['error'] ?? e.toString());
      } else {
        // Handle network error
        ApiUtils.showAlert(e.message ?? e.error.toString());
      }
    }
  }

  static void getuserProfile() async {
    final api = Dio();
    api.options.headers = ApiUtils.header();

    try {
      var request = await api.get("$BASE_URL/api/profile");

      ApiResponse<ProfileModel> response = ApiResponse.fromJson(request.data);
      var controller = GlobalController.i;
      controller.profile.value = response.data!;
    } on DioError catch (e) {
      if (e.response != null) {
        final response = e.response!;
        if (!ApiUtils.logout(response)) {
          ApiUtils.showAlert(response.data['error'] ?? e.toString());
        }
      } else {
        ApiUtils.showAlert(e.message ?? e.error.toString());
      }
    }
  }

  static void getAllRedeemReward() async {
    final api = Dio();
    api.options.headers = ApiUtils.header();

    try {
      var request = await api.get("$BASE_URL/api/rewards/view-all");
      ApiResponses<RedeemRewardModel> response =
          ApiResponses.fromJson(request.data);

      GlobalController controller = GlobalController.i;
      controller.redeems.value = response.data!;
    } on DioError catch (e) {
      if (e.response != null) {
        final response = e.response!;
        if (!ApiUtils.logout(response)) {
          ApiUtils.showAlert(response.data['error'] ?? e.toString());
        }
      } else {
        ApiUtils.showAlert(e.message ?? e.error.toString());
      }
    }
  }
}
