import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/controller/campaign/catering_binding.dart';
import 'package:mobile/controller/campaign/masak_controller.dart';
import 'package:mobile/controller/home/home_binding.dart';
import 'package:mobile/controller/profile/edit_profile_binding.dart';
import 'package:mobile/views/address/change_address_screen.dart';
import 'package:mobile/views/address/myaddress_screen.dart';
import 'package:mobile/views/address/new_address_screen.dart';
import 'package:mobile/views/auth/auth_binding.dart';
import 'package:mobile/views/auth/login_screen.dart';
import 'package:mobile/views/auth/register_bigparty_screen.dart';
import 'package:mobile/views/auth/register_screen.dart';
import 'package:mobile/views/campaign/campaign_detail_screen.dart';
import 'package:mobile/views/campaign/campaign_binding.dart';
import 'package:mobile/views/campaign/campaign_list_screen.dart';
import 'package:mobile/views/campaign/catering/campaign_procedure.dart';
import 'package:mobile/views/campaign/catering/catering_pickup.dart';
import 'package:mobile/views/campaign/catering/form_catering.dart';
import 'package:mobile/views/campaign/create_campaign_screen.dart';
import 'package:mobile/views/campaign/donate_success_screen.dart';
import 'package:mobile/views/campaign/food_campaign_screen.dart';
import 'package:mobile/views/campaign/pickup/pickup_detail_screen.dart';
import 'package:mobile/views/chips/chips_purchase_screen.dart';
import 'package:mobile/views/chips/chips_store_screen.dart';
import 'package:mobile/views/chips/mycart_screen.dart';
import 'package:mobile/views/history/history_binding.dart';
import 'package:mobile/views/history/history_screen.dart';
import 'package:mobile/views/home/home_screen.dart';
import 'package:mobile/views/launch/splash_screen.dart';
import 'package:mobile/routes/app_routes.dart';
import 'package:mobile/views/launch/onboarding_screen.dart';
import 'package:mobile/views/profile/edit_profile_screen.dart';
import 'package:mobile/views/profile/profile_screen.dart';
import 'package:mobile/views/rewards/reward_screen.dart';
import 'package:mobile/controller/chips/chips_binding.dart';

List<GetPage<dynamic>> appRouter() {
  return <GetPage<dynamic>>[
    GetPage(
      name: RoutePage.splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: RoutePage.history,
      page: () => HistoryScreen(),
      binding: HistoryBinding(),
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
      binding: HomeBinding(),
      page: () => HomeScreen(),
    ),
    GetPage(
      name: RoutePage.campaignList,
      page: () => CampaignListScreen(),
    ),
    GetPage(
      name: '/campaign/:campaignId/detail',
      page: () => CampaignDetailScreen(),
      binding: CampaignBinding(),
    ),
    GetPage(
      name: '/campaign/:campaignId/food',
      page: () => FoodCampaignScreen(),
      binding: CampaignBinding(),
    ),
    GetPage(
      name: RoutePage.createCampaign,
      page: () => CreateCampaignScreen(),
      binding: CampaignBinding(),
    ),
    GetPage(
      name: RoutePage.campaignProcedure,
      page: () => CampaignProcedureScreen(),
    ),
    GetPage(
      name: '/campaign/:campaignId/pickup',
      page: () => PickupDetailScreen(),
      bindings: [
        CampaignBinding(),
        MasakBinding(),
      ],
    ),
    GetPage(
      name: RoutePage.donationSuccess,
      page: () => DonationSucessScreen(),
    ),
    GetPage(
      name: RoutePage.formCatering,
      page: () => FormCateringScreen(),
      bindings: [
        CampaignBinding(),
        CateringBinding(),
      ],
    ),
    GetPage(
      name: RoutePage.cateringPickup,
      page: () => CateringPickupScreen(),
      bindings: [
        CampaignBinding(),
        CateringBinding(),
      ],
    ),
    GetPage(
      name: RoutePage.registerBigparty,
      page: () => RegisterBigpartyScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: RoutePage.myAddress,
      page: () => MyAddressScreen(),
    ),
    GetPage(
      name: RoutePage.createAddress,
      page: () => NewAddressScreen(),
    ),
    GetPage(
      name: RoutePage.reward,
      page: () => RewardScreen(),
    ),
    GetPage(
      name: RoutePage.profile,
      page: () => UserProfileScreen(),
    ),
    GetPage(
      name: RoutePage.editProfile,
      page: () => EditProfileScreen(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: "/address/edit/:id",
      page: () => ChangeAddressScreen(),
    ),
    GetPage(
      name: RoutePage.chips,
      page: () => ChipsStoreScreen(),
      binding: ChipsBinding(),
    ),
    GetPage(
      name: RoutePage.chipsCart,
      page: () => MyCartScreen(),
      binding: ChipsBinding(),
    ),
    GetPage(
      name: RoutePage.chipsPurchase,
      page: () => ChipsPurchaseScreen(),
      binding: ChipsBinding(),
    ),
  ];
}
