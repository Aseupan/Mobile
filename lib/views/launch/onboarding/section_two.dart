import 'package:flutter/material.dart';
import 'package:mobile/utils/color_contant.dart';
import 'package:mobile/widgets/animation/fadein_left.dart';
import 'package:mobile/widgets/animation/opacity_transition.dart';
import 'package:mobile/widgets/text_styles.dart';

class SectionOnboarding2 extends StatefulWidget {
  const SectionOnboarding2({super.key});

  @override
  State<SectionOnboarding2> createState() => SectionOnboarding2State();
}

class SectionOnboarding2State extends State<SectionOnboarding2> {
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
                  "But with sharing\nthe more happiness\nyou will get",
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
              image: AssetImage("assets/images/onboarding2.png"),
            ),
          ),
          SizedBox()
        ],
      ),
    );
  }
}
