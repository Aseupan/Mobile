// class AppRouter {}

import 'package:get/get.dart';
import 'package:mobile/views/auth/auth_binding.dart';
import 'package:mobile/views/auth/login_screen.dart';
import 'package:mobile/views/auth/register_bigparty_screen.dart';
import 'package:mobile/views/auth/register_screen.dart';
import 'package:mobile/views/campaign/campaigh_detail_screen.dart';
import 'package:mobile/views/campaign/campaign_binding.dart';
import 'package:mobile/views/campaign/campaign_list_screen.dart';
import 'package:mobile/views/campaign/food_campaign_screen.dart';
import 'package:mobile/views/campaign/pickup_detail_screen.dart';
import 'package:mobile/views/home/home_screen.dart';
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
      binding: AuthBinding(),
    ),
    GetPage(
      name: RoutePage.register,
      page: () => RegisterScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: RoutePage.home,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: RoutePage.campaignList,
      page: () => CampaignListScreen(),
    ),
    GetPage(
      name: '/campaign/:campaignId',
      page: () => CampaignDetailScreen(),
    ),
    GetPage(
      name: '/campaign/:campaignId/food',
      page: () => FoodCampaignScreen(),
      binding: CampaignBinding(),
    ),
    GetPage(
      name: '/campaign/:campaignId/pickup',
      page: () => PickupDetailScreen(),
    ),
    GetPage(
      name: RoutePage.registerBigparty,
      page: () => RegisterBigpartyScreen(),
      binding: AuthBinding(),
    )
  ];
}
