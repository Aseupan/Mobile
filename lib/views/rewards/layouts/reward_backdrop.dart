import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobile/controller/global/global_controller.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/widgets/text_styles.dart';
import 'package:sizer/sizer.dart';

class RewardBackdrop extends StatelessWidget {
  final controller = GlobalController.i;

  RewardBackdrop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: ColorConstants.gradient[3],
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: -40,
            right: -40,
            child: SvgPicture.asset("assets/images/backdrop_reward.svg"),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 58),
                Text(
                  'Rewards',
                  style: h1TextStyle(
                    color: ColorConstants.slate[25],
                    weight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 25),
                Text(
                  'My Chips',
                  style: body5TextStyle(
                    weight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check_circle_rounded,
                      color: Colors.white,
                      size: 19,
                    ),
                    SizedBox(width: 5),
                    Obx(
                      () => Text(
                        "${controller.profile.value.point}",
                        style: h1TextStyle(
                          weight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 9),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  clipBehavior: Clip.hardEdge,
                  width: 160,
                  child: LinearProgressIndicator(
                    color: ColorConstants.secondary[600],
                    backgroundColor: ColorConstants.slate[800],
                    minHeight: 5,
                    value: (controller.profile.value.point / 500) > 1
                        ? 1
                        : (controller.profile.value.point / 500) + 0.01,
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.info_outline_rounded,
                      size: 12,
                      color: Colors.white,
                    ),
                    SizedBox(width: 5),
                    Flexible(
                      child: Text(
                        "Collect 500 chips before July\n31st to get special treasure!",
                        style: TextStyle(
                          fontSize: 10,
                          color: ColorConstants.slate[25],
                          fontWeight: FontWeight.w600,
                          height: 1.1,
                        ),
                      ),
                    ),
                    SizedBox(height: 100),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
