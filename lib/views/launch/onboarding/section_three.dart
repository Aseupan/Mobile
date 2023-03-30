import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/routes/app_routes.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/views/launch/widgets/register_modal.dart';
import 'package:mobile/widgets/animation/fadein_left.dart';
import 'package:mobile/widgets/animation/opacity_transition.dart';
import 'package:mobile/widgets/text_styles.dart';
import 'package:sizer/sizer.dart';

class SectionOnboarding3 extends StatefulWidget {
  const SectionOnboarding3({super.key});

  @override
  State<SectionOnboarding3> createState() => SectionOnboarding3State();
}

class SectionOnboarding3State extends State<SectionOnboarding3> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FadeInFromLeft(
            duration: Duration(
              milliseconds: 700,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 40,
                ),
                Text(
                  "Let’s start sharing\nwith arround you!",
                  style: h1TextStyle(
                    weight: FontWeight.w800,
                    color: ColorConstants.slate[900],
                  ),
                ),
              ],
            ),
          ),
          OpacityTransitionWidget(
            duration: Duration(
              seconds: 1,
              milliseconds: 400,
            ),
            child: Image(
              image: AssetImage("assets/images/onboarding3.png"),
            ),
          ),
          Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(RoutePage.login);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  fixedSize: Size(70.w, 30),
                  backgroundColor: ColorConstants.primary[600],
                ),
                child: Text(
                  'Login',
                ),
              ),
              SizedBox(height: 1),
              OutlinedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (builder) {
                      return RegisterModal();
                    },
                  );
                },
                style: OutlinedButton.styleFrom(
                    fixedSize: Size(70.w, 10),
                    side: BorderSide(
                      color: ColorConstants.primary[600]!,
                      width: 1,
                    )),
                child: Text(
                  'Register',
                ),
              ),
            ],
          ),
          SizedBox()
        ],
      ),
    );
  }
}
