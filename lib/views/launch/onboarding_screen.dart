import 'package:flutter/material.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/views/launch/onboarding/section_one.dart';
import 'package:mobile/views/launch/onboarding/section_three.dart';
import 'package:mobile/views/launch/onboarding/section_two.dart';
import 'package:sizer/sizer.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _onBoarding = 1;

  Widget SectionOnboarding() {
    switch (_onBoarding) {
      case 1:
        return SectionOnboarding1();
      case 2:
        return SectionOnboarding2();
      case 3:
        return SectionOnboarding3();
      default:
        return SectionOnboarding1();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.slate[25],
      body: Container(
        height: 100.h,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              width: 100.w,
              height: 15.h,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionOnboarding(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 30),
                          _onBoarding != 1
                              ? TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: ColorConstants.slate[25],
                                    foregroundColor: ColorConstants.slate[900],
                                  ),
                                  onPressed: _onBoarding != 1
                                      ? () {
                                          setState(() {
                                            _onBoarding -= 1;
                                            print(_onBoarding);
                                          });
                                        }
                                      : null,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.chevron_left,
                                      ),
                                      SizedBox(width: 7),
                                      Text(
                                        'Back',
                                      ),
                                    ],
                                  ),
                                )
                              : Container()
                        ],
                      ),
                      Row(
                        children: [
                          _onBoarding != 3
                              ? ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: ColorConstants.slate[25],
                                    foregroundColor: ColorConstants.slate[900],
                                  ),
                                  onPressed: _onBoarding != 3
                                      ? () {
                                          setState(() {
                                            _onBoarding += 1;
                                            print(_onBoarding);
                                          });
                                        }
                                      : null,
                                  child: Row(
                                    children: [
                                      Text(
                                        'Continue',
                                      ),
                                      SizedBox(width: 7),
                                      Icon(
                                        Icons.chevron_right,
                                      ),
                                    ],
                                  ),
                                )
                              : Container(),
                          SizedBox(width: 30)
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              width: 100.w,
              height: 8.75.h,
            )
          ],
        ),
      ),
    );
  }
}
