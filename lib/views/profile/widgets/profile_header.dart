import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/controller/global/global_controller.dart';
import 'package:mobile/routes/app_routes.dart';
import 'package:mobile/services/api/app_token.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/views/profile/layout/button_buy_chips.dart';
import 'package:mobile/widgets/text_styles.dart';
import 'package:sizer/sizer.dart';

class ProfileHeader extends StatelessWidget {
  GlobalController controller = GlobalController.i;

  ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Profile',
              style: h1TextStyle(
                weight: FontWeight.w800,
              ),
            ),
            InkWell(
              onTap: () {
                Get.toNamed(RoutePage.editProfile);
              },
              child: Container(
                padding: EdgeInsets.only(bottom: 2),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: ColorConstants.slate[400]!,
                      width: 1.0, // Underline thickness
                    ),
                  ),
                ),
                child: Text(
                  'Edit my profile',
                  style: body6TextStyle(color: ColorConstants.slate[400]),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        SizedBox(
          height: 68,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                "assets/images/dummy_profile.png",
                width: 68,
                height: 68,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 18),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 60.w,
                    child: Obx(
                      () => Text(
                        controller.profile.value.name,
                        style: h4TextStyle(weight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Obx(() {
                    var data = controller.profile.value.phone;
                    return Text(data.isEmpty ? '-' : data);
                  }),
                  Container(
                    decoration: BoxDecoration(
                      color: ColorConstants.primary[600],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                    child: Text(
                      'Regular Food Giver',
                      style: body6TextStyle(
                        weight: FontWeight.w600,
                        color: ColorConstants.slate[25],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(height: 30),
        ButtonBuyChips(),
      ],
    );
  }
}
