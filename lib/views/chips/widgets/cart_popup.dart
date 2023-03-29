import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/controller/chips/chips_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/controller/global/global_controller.dart';
import 'package:mobile/routes/app_routes.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/views/chips/widgets/dialog_chips.dart';
import 'package:mobile/widgets/text_styles.dart';

class CartPopup extends StatelessWidget {
  final controller = ChipsController.i;
  final globalController = GlobalController.i;
  CartPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              Get.toNamed(RoutePage.chipsCart);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7),
              ),
              padding: EdgeInsets.symmetric(vertical: 13, horizontal: 20),
              child: Row(children: [
                SvgPicture.asset(
                  "assets/icons/cart.svg",
                  width: 30,
                  height: 30,
                ),
                SizedBox(width: 14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Cart',
                      style: TextStyle(
                        color: ColorConstants.slate[400],
                        fontSize: 10,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      '${controller.totalPoints} Chips',
                      style: body5TextStyle(weight: FontWeight.bold),
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ),
        SizedBox(width: 16),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: Size(60, 60),
            padding: EdgeInsets.all(0),
          ),
          onPressed: () {
            if (globalController.profile.value.phone == "") {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => DialogChips(context));
            }
            Get.toNamed(RoutePage.chipsPurchase);
          },
          child: Center(
            child: Icon(Icons.chevron_right, size: 40),
          ),
        )
      ],
    );
  }
}
