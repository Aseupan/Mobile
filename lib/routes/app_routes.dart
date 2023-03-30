class RoutePage {
  // Phase 1
  static const String splash = "/splash";
  static const String onBoarding = "/onBoarding";
  static const String login = "/login";
  static const String register = "/register";
  static const String registerBigparty = "/b/register";
  static const String myAddress = "/address";
  static const String createAddress = "/address/create";
  static String editAddress(num id) {
    return "/address/edit/$id";
  }

  static const String reward = "/reward";
  static const String profile = "/profile";
  static const String editProfile = "/profile/edit";

  static const String chips = "/chips";
  static const String chipsCart = "/chips/carts";
  static const String chipsPurchase = "/chips/purchase";

  // Phase 2
  static const String home = "/home";

  // CAMPAIGN
  static const String campaignList = "/campaign";
  static String campaignDetail(num campaignId) {
    return '/campaign/:$campaignId/detail';
  }

  static const String createCampaign = "/campaign/create";

  static String foodDetail(num campaignId) {
    return '/campaign/:$campaignId/food';
  }

  static String pickupDetail(num campaignId) {
    return '/campaign/:$campaignId/pickup';
  }
}
