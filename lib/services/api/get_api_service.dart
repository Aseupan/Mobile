import 'package:dio/dio.dart';
import 'package:mobile/controller/campaign/campaign_controller.dart';
import 'package:mobile/controller/campaign/catering_controller.dart';
import 'package:mobile/controller/chips/chips_controller.dart';
import 'package:mobile/controller/global/company_controller.dart';
import 'package:mobile/controller/global/global_controller.dart';
import 'package:mobile/controller/home/home_controller.dart';
import 'package:mobile/models/address/address_model.dart';
import 'package:mobile/models/campaign/campaign_model.dart';
import 'package:mobile/models/catering/catering_model.dart';
import 'package:mobile/models/chips/cart_response_model.dart';
import 'package:mobile/models/chips/chips_model.dart';
import 'package:mobile/models/home/information_card.dart';
import 'package:mobile/models/profile/company_profile_model.dart';
import 'package:mobile/models/profile/profile_model.dart';
import 'package:mobile/models/response.dart';
import 'package:mobile/models/reward/redeem_reward_model.dart';
import 'package:mobile/services/api/api_utils.dart';
import 'package:mobile/services/api/base_url.dart';

class GetApiService {
  static void getInformations() async {
    final api = Dio();

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
      var controller = GlobalController.i;

      if (controller.isAdmin.value) {
        ApiResponse<CompanyProfileModel> response =
            ApiResponse.fromJson(request.data);

        var companyController = CompanyController.i;
        companyController.profile.value = response.data!;
      } else {
        ApiResponse<ProfileModel> response = ApiResponse.fromJson(request.data);
        controller.profile.value = response.data!;
      }
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

  static void getAllAddresses() async {
    final api = Dio();
    api.options.headers = ApiUtils.header();

    try {
      var request = await api.get("$BASE_URL/api/addresses");

      ApiResponses<AddressModel> response = ApiResponses.fromJson(request.data);
      GlobalController controller = GlobalController.i;

      controller.address.value = response.data!;
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

  static void getAllChips() async {
    final api = Dio();
    api.options.headers = ApiUtils.header();

    try {
      var request = await api.get("$BASE_URL/api/credit-store/all");

      ApiResponses<ChipsModel> response = ApiResponses.fromJson(request.data);
      GlobalController controller = GlobalController.i;

      controller.chips.value = response.data!;
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

  static void getCart() async {
    final api = Dio();
    api.options.headers = ApiUtils.header();

    try {
      var request = await api.get("$BASE_URL/api/credit-store/view-cart");

      ApiResponse<CartResponseModel> response =
          ApiResponse.fromJson(request.data);
      ChipsController controller = ChipsController.i;

      controller.carts.value = response.data!.cart;
      controller.total.value = response.data!.total;
      controller.totalPoints.value = response.data!.totalPoints;
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

  static void getCampaigns() async {
    final api = Dio();
    api.options.headers = ApiUtils.header();

    try {
      var request = await api.get("$BASE_URL/api/campaign/user/all");

      ApiResponses<CampaignModel> response =
          ApiResponses.fromJson(request.data);

      GlobalController controller = GlobalController.i;
      controller.campaigns.value = response.data!;
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

  static void getCampaignById(String id) async {
    final api = Dio();
    api.options.headers = ApiUtils.header();

    try {
      var request = await api.get("$BASE_URL/api/campaign/user/detail/$id");

      ApiResponse<CampaignModel> response = ApiResponse.fromJson(request.data);

      CampaignModel data = response.data!;
      CampaignController controller = CampaignController.i;
      controller.campaignDetail[id] = response.data!;

      List<String> thumbnails = [];

      if (data.thumbnail_1 != "") thumbnails.add(data.thumbnail_1);
      if (data.thumbnail_2 != "") thumbnails.add(data.thumbnail_2);
      if (data.thumbnail_3 != "") thumbnails.add(data.thumbnail_3);
      if (data.thumbnail_4 != "") thumbnails.add(data.thumbnail_4);
      if (data.thumbnail_5 != "") thumbnails.add(data.thumbnail_5);
      controller.thumbnailById[id] = thumbnails;
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

  static void getAllCetering() async {
    final api = Dio();
    api.options.headers = ApiUtils.header();

    try {
      var request = await api.get("$BASE_URL/api/campaign/user/catering");

      ApiResponses<CateringModel> response =
          ApiResponses.fromJson(request.data);
      CateringController controller = CateringController.i;
      controller.caterings.value = response.data!;
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
