class RoutePage {
  // Phase 1
  static const String splash = "/splash";
  static const String onBoarding = "/onBoarding";
  static const String login = "/login";
  static const String register = "/register";

  // Phase 2
  static const String home = "/home";
  static const String campaignList = "/campaign";
  static String campaignDetail(num campaignId) {
    return '/campaign/:$campaignId';
  }

  static String foodDetail(num campaignId) {
    return '/campaign/:$campaignId/food';
  }
}
