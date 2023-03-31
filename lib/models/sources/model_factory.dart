import 'package:mobile/models/address/address_model.dart';
import 'package:mobile/models/campaign/campaign_model.dart';
import 'package:mobile/models/catering/catering_model.dart';
import 'package:mobile/models/chips/cart_response_model.dart';
import 'package:mobile/models/chips/chips_model.dart';
import 'package:mobile/models/home/information_card.dart';
import 'package:mobile/models/login/login.dart';
import 'package:mobile/models/profile/company_profile_model.dart';
import 'package:mobile/models/profile/profile_model.dart';
import 'package:mobile/models/reward/redeem_reward_model.dart';

abstract class ModelFactory {
  factory ModelFactory.fromJson(Type type, Map<String, dynamic> json) {
    final strType = type.toString().replaceAll("?", "");

    if (strType == (LoginModel).toString()) {
      return LoginModel.fromJson(json);
    } else if (strType == (InformationCard).toString()) {
      return InformationCard.fromJson(json);
    } else if (strType == (ProfileModel).toString()) {
      return ProfileModel.fromJson(json);
    } else if (strType == (RedeemRewardModel).toString()) {
      return RedeemRewardModel.fromJson(json);
    } else if (strType == (AddressModel).toString()) {
      return AddressModel.fromJson(json);
    } else if (strType == (ChipsModel).toString()) {
      return ChipsModel.fromJson(json);
    } else if (strType == (CartResponseModel).toString()) {
      return CartResponseModel.fromJson(json);
    } else if (strType == (CompanyProfileModel).toString()) {
      return CompanyProfileModel.fromJson(json);
    } else if (strType == (CampaignModel).toString()) {
      return CampaignModel.fromJson(json);
    } else if (strType == (CateringModel).toString()) {
      return CateringModel.fromJson(json);
    } else {
      throw UnimplementedError('`$type` factory unimplemented.');
    }
  }
}
