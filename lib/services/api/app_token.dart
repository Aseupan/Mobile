import 'package:get_storage/get_storage.dart';

class UserToken {
  static String getToken() {
    final storage = GetStorage();

    return storage.read('user_token') ?? '';
  }

  static void setToken(token) async {
    final storage = GetStorage();
    await storage.write('user_token', token);
    await storage.write('app_token', token);
  }

  static void clearToken() async {
    var storage = GetStorage();
    storage.remove("user_token");
  }

  static bool checkToken() {
    final storage = GetStorage();
    if (storage.read('user_token') == null &&
        storage.read('user_token') == "") {
      return false;
    }
    return true;
  }
}

class AppToken {
  static String getToken() {
    final storage = GetStorage();
    return storage.read('app_token') ?? '';
  }

  static void clearToken() async {
    var storage = GetStorage();
    storage.remove("app_token");
  }

  static bool checkToken() {
    final storage = GetStorage();
    if (storage.read('app_token') == null && storage.read('app_token') == "") {
      return false;
    }
    return true;
  }
}

class AdminToken {
  static String getToken() {
    final storage = GetStorage();
    return storage.read('admin_token') ?? '';
  }

  static void setToken(token) async {
    final storage = GetStorage();
    await storage.write('admin_token', token);
    await storage.write('app_token', token);
  }

  static void clearToken() async {
    var storage = GetStorage();
    storage.remove("admin_token");
  }

  static bool checkToken() {
    final storage = GetStorage();
    if (storage.read('admin_token') == null &&
        storage.read('admin_token') == "") {
      return false;
    }
    return true;
  }
}
