import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/routes/app_routes.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/widgets/text_styles.dart';

Widget DialogChips(BuildContext context) {
  return Dialog(
    child: Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Your Profile is Not Complete',
            style: h4TextStyle(
              weight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Please update your phone number before doing payment',
            style: body5TextStyle(color: ColorConstants.slate[400]),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                ),
                onPressed: () {
                  Get.back();
                  Get.toNamed(RoutePage.editProfile);
                },
                child: Text(
                  'Go to Edit Profile',
                  style: body6TextStyle(
                    weight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}
