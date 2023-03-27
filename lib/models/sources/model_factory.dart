import 'package:mobile/models/home/information_card.dart';
import 'package:mobile/models/login/login.dart';
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
    } else {
      throw UnimplementedError('`$type` factory unimplemented.');
    }
  }
}
