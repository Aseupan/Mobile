import 'package:mobile/services/api/base_url.dart';
import 'package:mobile/services/models/login/login.dart';
import 'package:mobile/services/models/response.dart';
import 'package:mobile/services/models/sources/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_services.g.dart';

@RestApi(
    baseUrl:
        'https://b97e-2405-8740-31f1-2015-e1fe-b8c8-e38d-5b9b.ap.ngrok.io/api')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  static Future<RestClient> create() async {
    return RestClient(
      await AppDio().getDIO(),
      baseUrl: BASE_URL,
    );
  }

  @POST('/login')
  Future<ApiResponse<LoginModel>> login({
    @Field("username") String? username,
    @Field("password") String? password,
  });
}

final client = RestClient.create();
