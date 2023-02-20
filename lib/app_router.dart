// class AppRouter {}

import 'package:get/get.dart';
import 'package:mobile/ui/screen/login_screen.dart';
import 'package:mobile/ui/screen/onboaring_screen/1.dart';
import 'package:mobile/ui/screen/onboaring_screen/2.dart';
import 'package:mobile/ui/screen/onboaring_screen/3.dart';
import 'package:mobile/ui/screen/register_screen.dart';
import 'package:mobile/ui/screen/splash_screen.dart';
import 'package:mobile/utils/route_names.dart';

List<GetPage<dynamic>> appRouter() {
  return <GetPage<dynamic>>[
    GetPage(
      name: RoutePage.splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: RoutePage.onBoarding1,
      page: () => OnBoarding1(),
    ),
    GetPage(
      name: RoutePage.onBoarding2,
      page: () => OnBoarding2(),
    ),
    GetPage(
      name: RoutePage.onBoarding3,
      page: () => OnBoarding3(),
    ),
    GetPage(
      name: RoutePage.login,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: RoutePage.register,
      page: () => RegisterScreen(),
    )
  ];
}
