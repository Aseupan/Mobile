import 'package:mobile/models/home/information_card.dart';
import 'package:mobile/models/login/login.dart';

abstract class ModelFactory {
  factory ModelFactory.fromJson(Type type, Map<String, dynamic> json) {
    final strType = type.toString().replaceAll("?", "");

    if (strType == (LoginModel).toString()) {
      return LoginModel.fromJson(json);
    } else if (strType == (InformationCard).toString()) {
      return InformationCard.fromJson(json);
    } else {
      throw UnimplementedError('`$type` factory unimplemented.');
    }
  }
}
