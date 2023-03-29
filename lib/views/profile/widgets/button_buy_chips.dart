import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/routes/app_routes.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/widgets/text_styles.dart';

class ButtonBuyChips extends StatelessWidget {
  const ButtonBuyChips({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('asdasdasd');
        Get.toNamed(RoutePage.chips);
      },
      child: Container(
        decoration: BoxDecoration(
          color: ColorConstants.flowerBlue[600],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "assets/images/backdrop_logo_white.png",
              height: 50,
            ),
            Text(
              'Buy additional Chips here!',
              style: body6TextStyle(
                weight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                ),
                SizedBox(width: 14),
              ],
            )
          ],
        ),
      ),
    );
  }
}
