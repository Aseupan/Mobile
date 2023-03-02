import 'package:get_storage/get_storage.dart';

class UserToken {
  static String getToken() {
    final storage = GetStorage();
    return storage.read('user_token');
  }

  static void setToken(token) async {
    final storage = GetStorage();
    await storage.write('user_token', token);
  }

  static void clearToken() async {
    var storage = GetStorage();
    storage.remove("user_token");
  }
}
