import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart' hide Response hide FormData hide MultipartFile;
import 'package:mobile/controller/global/company_controller.dart';
import 'package:mobile/controller/global/global_controller.dart';
import 'package:mobile/models/address/address_model.dart';
import 'package:mobile/models/login/login.dart';
import 'package:mobile/models/profile/company_profile_model.dart';
import 'package:mobile/models/profile/profile_model.dart';
import 'package:mobile/models/response.dart';
import 'package:mobile/routes/app_routes.dart';
import 'package:mobile/services/api/api_utils.dart';
import 'package:mobile/services/api/base_url.dart';
import 'package:mobile/services/api/app_token.dart';
import 'package:dio/dio.dart';
import 'package:mobile/services/api/get_api_service.dart';

class PostApiService {
  // static Future<ApiResponse<LoginModel>> login(data) async {
  static void login(data) async {
    final api = Dio();

    try {
      Response request =
          await api.post("$BASE_URL/api/login", data: jsonEncode(data));

      ApiResponse<LoginModel> response = ApiResponse.fromJson(request.data);
      ApiUtils.showAlert('Login Successed', isSuccess: true);
      GlobalController controller = GlobalController.i;

      if (response.data!.type == "user") {
        UserToken.setToken(response.data!.token);
        controller.isAdmin.value = false;
      } else {
        AdminToken.setToken(response.data!.token);
        controller.isAdmin.value = true;
      }
      Get.offAllNamed(RoutePage.home);
    } on DioError catch (e) {
      if (e.response != null) {
        final response = e.response!;
        ApiUtils.showAlert(response.data['error']);
      } else {
        // Handle network error
        if (e.message != null) ApiUtils.showAlert(e.message!);
      }
    }
  }

  static void register(Map<String, String> data) async {
    final api = Dio();

    try {
      Response request =
          await api.post("$BASE_URL/api/user-register", data: jsonEncode(data));

      final loginData = {
        'email': data['email'],
        'password': data['password'],
      };

      ApiUtils.showAlert('Create Account Successed', isSuccess: true);

      login(loginData);
    } on DioError catch (e) {
      if (e.response != null) {
        final response = e.response!;
        ApiUtils.showAlert(response.data['message']);
      } else {
        // Handle network error
        if (e.message != null) ApiUtils.showAlert(e.message!);
      }
    }
  }

  static void registerCompany(Map<String, String> data) async {
    final api = Dio();

    try {
      Response request = await api.post("$BASE_URL/api/company-register",
          data: jsonEncode(data));

      final loginData = {
        'email': data['company_email'],
        'password': data['password'],
      };

      ApiUtils.showAlert('Create Account Successed', isSuccess: true);

      login(loginData);
    } on DioError catch (e) {
      if (e.response != null) {
        final response = e.response!;
        ApiUtils.showAlert(response.data['message']);
      } else {
        // Handle network error
        if (e.message != null) ApiUtils.showAlert(e.message!);
      }
    }
  }

  static void updateProfile(Map<String, String> data) async {
    final api = Dio();
    api.options.headers = ApiUtils.header();

    try {
      var request =
          await api.patch("$BASE_URL/api/profile", data: jsonEncode(data));
      var controller = GlobalController.i;

      if (controller.isAdmin.value) {
        ApiResponse<CompanyProfileModel> response =
            ApiResponse.fromJson(request.data);

        var companyController = CompanyController.i;
        companyController.profile.value = response.data!;
        ApiUtils.showAlert(response.message, isSuccess: true);
      } else {
        ApiResponse<ProfileModel> response = ApiResponse.fromJson(request.data);
        controller.profile.value = response.data!;
        ApiUtils.showAlert(response.message, isSuccess: true);
      }

      Get.back();
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

  static void updatePhotoProfile(File image) async {
    final api = Dio();
    api.options.headers = ApiUtils.header();
    FormData formData = FormData.fromMap({
      "pp": await MultipartFile.fromFile(image.path),
    });

    try {
      var request =
          await api.patch("$BASE_URL/api/profile/picture", data: formData);

      var controller = GlobalController.i;

      if (controller.isAdmin.value) {
        ApiResponse<CompanyProfileModel> response =
            ApiResponse.fromJson(request.data);

        var companyController = CompanyController.i;
        companyController.profile.value = response.data!;
        ApiUtils.showAlert(response.message, isSuccess: true);
      } else {
        ApiResponse<ProfileModel> response = ApiResponse.fromJson(request.data);
        controller.profile.value = response.data!;
        ApiUtils.showAlert(response.message, isSuccess: true);
      }

      Get.back();
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

  static void addNewAddress(
    Map<String, String> data, {
    bool isPrimary = false,
  }) async {
    final api = Dio();
    api.options.headers = ApiUtils.header();

    try {
      var request = await api.post(
        "$BASE_URL/api/address",
        data: jsonEncode(data),
      );

      ApiResponse<AddressModel> response = ApiResponse.fromJson(request.data);
      ApiUtils.showAlert(response.message, isSuccess: true);
      GetApiService.getAllAddresses();
      if (isPrimary) {
        setPrimaryAddress("${response.data!.index}");
      }

      Get.back();
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

  static void changeAddress(
    Map<String, String> data,
    String id, {
    bool isPrimary = false,
  }) async {
    final api = Dio();
    api.options.headers = ApiUtils.header();

    try {
      var request = await api.patch(
        "$BASE_URL/api/address/$id",
        data: jsonEncode(data),
      );

      ApiResponse<AddressModel> response = ApiResponse.fromJson(request.data);
      ApiUtils.showAlert(response.message, isSuccess: true);
      GetApiService.getAllAddresses();
      if (isPrimary) {
        setPrimaryAddress(id);
      }
      Get.back();
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

  static void setPrimaryAddress(String id) async {
    final api = Dio();
    api.options.headers = ApiUtils.header();

    try {
      var request = await api.patch(
        "$BASE_URL/api/address/$id/primary",
      );

      ApiResponse<AddressModel> response = ApiResponse.fromJson(request.data);
      ApiUtils.showAlert(response.message, isSuccess: true);
      GetApiService.getAllAddresses();
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

  static void deleteAddress(String id) async {
    final api = Dio();
    api.options.headers = ApiUtils.header();

    try {
      var request = await api.delete(
        "$BASE_URL/api/address/$id",
      );

      ApiUtils.showAlert(request.data['message'], isSuccess: true);
      GetApiService.getAllAddresses();
      Get.back();
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

  static void addToCart(num id) async {
    final api = Dio();
    api.options.headers = ApiUtils.header();

    try {
      var request = await api.post(
        "$BASE_URL/api/credit-store/add-amount/$id",
      );

      ApiUtils.showAlert(request.data['message'], isSuccess: true);
      GetApiService.getCart();
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

  static void addOneItemCart(num id) async {
    final api = Dio();
    api.options.headers = ApiUtils.header();

    try {
      await api.post(
        "$BASE_URL/api/credit-store/add-amount/$id",
      );

      GetApiService.getCart();
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

  static void removeOneItemCart(num id) async {
    final api = Dio();
    api.options.headers = ApiUtils.header();

    try {
      await api.post(
        "$BASE_URL/api/credit-store/remove-amount/$id",
      );

      GetApiService.getCart();
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

  static void purchaseChips(int id) async {
    final api = Dio();
    api.options.headers = ApiUtils.header();

    try {
      var request = await api.post(
        "$BASE_URL/api/credit-store/payment",
        data: jsonEncode(
          {
            "payment_method": id,
          },
        ),
      );
      ApiUtils.showAlert(request.data['message'], isSuccess: true);
      Get.back();

      GetApiService.getCart();
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

  static void createCampaign(FormData data) async {
    final api = Dio();
    api.options.headers = ApiUtils.header();

    try {
      var request =
          await api.post("$BASE_URL/api/campaign/company/create", data: data);

      ApiUtils.showAlert(request.data['message'], isSuccess: true);
      Get.back();
      Get.back();
    } on DioError catch (e) {
      if (e.response != null) {
        final response = e.response!;
        if (!ApiUtils.logout(response)) {
          ApiUtils.showAlert(response.data['error'] ?? e.toString());
        }
      } else {
        ApiUtils.showAlert(e.message ?? e.error.toString());
      }
      Get.back();
    }
  }

  static void createDonationCatering(
      Map<String, dynamic> data, String campaignId, int cateringID) async {
    final api = Dio();
    api.options.headers = ApiUtils.header();

    try {
      var request = await api.post(
          "$BASE_URL/api/campaign/user/donate/catering/$campaignId/$cateringID",
          data: jsonEncode(data));

      ApiUtils.showAlert(request.data['message'], isSuccess: true);
      Get.back();
      Get.toNamed(RoutePage.donationSuccess);
    } on DioError catch (e) {
      if (e.response != null) {
        final response = e.response!;
        if (!ApiUtils.logout(response)) {
          ApiUtils.showAlert(response.data['error'] ?? e.toString());
        }
      } else {
        ApiUtils.showAlert(e.message ?? e.error.toString());
      }
      Get.back();
    }
  }

  static void confirmDonation(
      Map<String, dynamic> data, String campaignId) async {
    final api = Dio();
    api.options.headers = ApiUtils.header();

    try {
      var request = await api.post(
          "$BASE_URL/api/campaign/user/donate/$campaignId/confirm",
          data: jsonEncode(data));

      ApiUtils.showAlert(request.data['message'], isSuccess: true);
      Get.back();
      Get.toNamed(RoutePage.donationSuccess);
    } on DioError catch (e) {
      if (e.response != null) {
        final response = e.response!;
        if (!ApiUtils.logout(response)) {
          ApiUtils.showAlert(response.data['error'] ?? e.toString());
        }
      } else {
        ApiUtils.showAlert(e.message ?? e.error.toString());
      }
      Get.back();
    }
  }

  static void createDonation(Map<String, dynamic> data, String campaignId,
      Map<String, dynamic> confirmData) async {
    final api = Dio();
    api.options.headers = ApiUtils.header();
    print(campaignId);

    try {
      var request = await api.post(
          "$BASE_URL/api/campaign/user/donate/personal/$campaignId",
          data: jsonEncode(data));

      // ApiUtils.showAlert(request.data['message'], isSuccess: true);
      // Get.back();
      // Get.toNamed(RoutePage.donationSuccess);

      confirmDonation(confirmData, campaignId);
    } on DioError catch (e) {
      if (e.response != null) {
        final response = e.response!;
        if (!ApiUtils.logout(response)) {
          ApiUtils.showAlert(response.data['error'] ?? e.toString());
        }
      } else {
        ApiUtils.showAlert(e.message ?? e.error.toString());
      }
      Get.back();
    }
  }
}
