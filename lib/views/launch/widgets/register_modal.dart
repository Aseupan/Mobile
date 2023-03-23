import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/routes/app_routes.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/widgets/text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class RegisterModal extends StatelessWidget {
  const RegisterModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      color: ColorConstants.slate[25],
      padding: EdgeInsets.symmetric(
        vertical: 35,
        horizontal: 25,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'What kind user are you?',
            style: h3TextStyle(weight: FontWeight.bold),
          ),
          SizedBox(height: 31),
          InkWell(
            onTap: () {
              Navigator.pop(context);
              Get.toNamed(RoutePage.register);
            },
            child: Container(
              height: 75,
              color: Colors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 90,
                    child: SvgPicture.asset(
                      "assets/images/register-regular.svg",
                      width: 63,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Regular Food Giver',
                        style: body5TextStyle(
                          color: ColorConstants.slate[900],
                          weight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'I am not make a campaign, I just donate',
                        style: body6TextStyle(
                          color: ColorConstants.slate[500],
                          size: 10,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.chevron_right,
                    size: 20,
                  ),
                  SizedBox()
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: () {
              Navigator.pop(context);
              Get.toNamed(RoutePage.registerBigparty);
            },
            child: Container(
              height: 75,
              color: Colors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 90,
                    child: SvgPicture.asset(
                      "assets/images/register-bigparty.svg",
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Big Party',
                        style: body5TextStyle(
                          color: ColorConstants.slate[900],
                          weight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'I will make a campaign and collect food',
                        style: body6TextStyle(
                          color: ColorConstants.slate[500],
                          size: 10,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.chevron_right,
                    size: 20,
                  ),
                  SizedBox()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
