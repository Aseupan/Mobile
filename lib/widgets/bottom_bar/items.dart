// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobile/controller/global/global_controller.dart';
import 'package:mobile/routes/app_routes.dart';
import 'package:mobile/utils/color_constants.dart';

class BottomBarItem extends StatelessWidget {
  GlobalController controller = GlobalController.i;
  int index = 1;
  int current;
  /*
  1 = Home
  2 = Reward
  3 = History
  4 = Profile
  */

  BottomBarItem({super.key, required this.index, required this.current});

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

  void navigateBar() {
    switch (controller.stateBar.value) {
      case 1:
        Get.toNamed(RoutePage.home);
        break;
      case 2:
        Get.toNamed(RoutePage.reward);
        break;
      case 3:
        // Get.toNamed(RoutePage.);
        break;
      case 4:
        Get.toNamed(RoutePage.profile);
        break;
      default:
        Get.toNamed(RoutePage.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.stateBar.value = index;
        navigateBar();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              SvgPicture.asset(
                iconName(),
                color: current == index
                    ? ColorConstants.flowerBlue[600]
                    : ColorConstants.slate[300],
              ),
              Text(
                iconText(),
                style: TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.w800,
                  color: current == index
                      ? ColorConstants.flowerBlue[600]
                      : ColorConstants.slate[300],
                ),
              ),
            ],
          ),
          current == index
              ? Image.asset("assets/icons/active_bar.png")
              : Container(),
        ],
      ),
    );
  }
}
