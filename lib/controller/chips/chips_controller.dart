import 'package:get/get.dart';
import 'package:mobile/models/chips/cart_model.dart';

class ChipsController extends GetxController {
  static ChipsController get i => Get.find();

  RxList<CartModel> carts = <CartModel>[].obs;

  RxInt total = 0.obs;
  RxInt totalPoints = 0.obs;
}
