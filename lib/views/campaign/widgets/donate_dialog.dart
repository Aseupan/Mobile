import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/routes/app_routes.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/widgets/text_styles.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DonateDialog extends StatelessWidget {
  const DonateDialog({super.key});

  @override
  Widget build(BuildContext context) {
    String id = Get.parameters['campaignId']?.substring(1) ?? "0";
    return Container(
      decoration: BoxDecoration(
        color: ColorConstants.slate[25],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      padding: EdgeInsets.only(
        left: 22,
        right: 22,
        top: 35,
        bottom: 42,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'How’d you share your food?',
            style: h3TextStyle(
              weight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              Get.back();
              Get.toNamed(RoutePage.foodDetail(num.parse(id)));
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              width: 100.w,
              height: 75,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 75,
                    width: 70,
                    child: SvgPicture.asset(
                      "assets/images/cook_myself.svg",
                      width: 75,
                      height: 70,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Cook by myself',
                          style: h5TextStyle(weight: FontWeight.bold),
                        ),
                        Text(
                          'All the food prepared by myself',
                          style: TextStyle(
                            fontSize: 10,
                            color: ColorConstants.slate[500],
                          ),
                        )
                      ],
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    size: 20,
                  ),
                  SizedBox(width: 12),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Get.back();
              Get.toNamed(RoutePage.campaignProcedure, parameters: {"id": id});
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              width: 100.w,
              height: 75,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 75,
                    width: 70,
                    child: SvgPicture.asset(
                      "assets/images/cook_catering.svg",
                      width: 75,
                      height: 70,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Cook by catering',
                          style: h5TextStyle(weight: FontWeight.bold),
                        ),
                        Text(
                          'All the food prepared by food catering',
                          style: TextStyle(
                            fontSize: 10,
                            color: ColorConstants.slate[500],
                          ),
                        )
                      ],
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    size: 20,
                  ),
                  SizedBox(width: 12),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
