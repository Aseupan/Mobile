// class AppRouter {}

import 'package:get/get.dart';
import 'package:mobile/views/auth/login_screen.dart';
import 'package:mobile/views/auth/register_screen.dart';
import 'package:mobile/views/launch/splash_screen.dart';
import 'package:mobile/routes/app_routes.dart';
import 'package:mobile/views/launch/onboarding_screen.dart';

List<GetPage<dynamic>> appRouter() {
  return <GetPage<dynamic>>[
    GetPage(
      name: RoutePage.splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: RoutePage.onBoarding,
      page: () => OnboardingScreen(),
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
