import 'package:get/get.dart';

class FoodDetail {
  var foodType = "".obs;
  var description = "".obs;
  RxInt quantity = 1.obs;
  RxInt weight = 1.obs;
  var expired = "".obs;
  RxBool isValid = false.obs;

  void checkValid() {
    if (foodType.isEmpty || description.isEmpty || expired.isEmpty) {
      isValid.value = false;
    } else {
      isValid.value = true;
    }
  }
}
