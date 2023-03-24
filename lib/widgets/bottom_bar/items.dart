import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobile/controller/global/global_controller.dart';
import 'package:mobile/utils/color_constants.dart';

class BottomBarItem extends StatelessWidget {
  GlobalController controller = GlobalController.i;
  int index = 1;
  /*
  1 = Home
  2 = Reward
  3 = History
  4 = Profile
  */
  BottomBarItem({super.key, required this.index});

  String iconName() {
    switch (index) {
      case 1:
        return "assets/icons/home_bar.svg";
      case 2:
        return "assets/icons/reward_bar.svg";
      case 3:
        return "assets/icons/history_bar.svg";
      case 4:
        return "assets/icons/profile_bar.svg";
      default:
        return "assets/icons/home_bar.svg";
    }
  }

  String iconText() {
    switch (index) {
      case 1:
        return "Home";
      case 2:
        return "Rewards";
      case 3:
        return "History";
      case 4:
        return "Profile";
      default:
        return "Home";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.stateBar.value = index;
      },
      child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                SvgPicture.asset(
                  iconName(),
                  color: controller.stateBar.value == index
                      ? ColorConstants.flowerBlue[600]
                      : ColorConstants.slate[300],
                ),
                Text(
                  iconText(),
                  style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w800,
                    color: controller.stateBar.value == index
                        ? ColorConstants.flowerBlue[600]
                        : ColorConstants.slate[300],
                  ),
                ),
              ],
            ),
            controller.stateBar.value == index
                ? Image.asset("assets/icons/active_bar.png")
                : Container(),
          ],
        ),
      ),
    );
  }
}
