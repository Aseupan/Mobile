import 'package:dio/dio.dart';
import 'package:mobile/controller/home/home_controller.dart';
import 'package:mobile/models/home/information_card.dart';
import 'package:mobile/models/response.dart';
import 'package:mobile/services/api/api_utils.dart';
import 'package:mobile/services/api/base_url.dart';

class GetApiService {
  static void getInformations() async {
    final api = Dio();
    // api.options.headers = ApiUtils.header();

    try {
      Response request = await api.get(
        "$BASE_URL/api/user/info/all-info",
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
        print(response.data);
        ApiUtils.showAlert(response.data['error'] ?? e.toString());
      } else {
        // Handle network error
        ApiUtils.showAlert(e.message ?? e.error.toString());
      }
    }
  }

  static void getuserProfile() {
    final api = Dio();
    api.options.headers = ApiUtils.header();

    try {} on DioError catch (e) {}
  }
}
