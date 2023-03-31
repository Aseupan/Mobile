import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/routes/app_routes.dart';
import 'package:mobile/widgets/text_styles.dart';

class MoreChips extends StatelessWidget {
  const MoreChips({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(RoutePage.chips);
      },
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.hardEdge,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "assets/images/more_chips_reward.png",
              height: 55,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Need more chips? Buy here',
                  style: body6TextStyle(
                    weight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8),
                Icon(Icons.chevron_right),
                SizedBox(width: 12),
              ],
            )
          ],
        ),
      ),
    );
  }
}
