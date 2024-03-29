import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:mobile/controller/global/global_controller.dart';
import 'package:mobile/routes/app_routes.dart';
import 'package:mobile/services/api/app_token.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double width = 110;
  bool state = false;
  GlobalController controller = GlobalController.i;

  @override
  void initState() {
    super.initState();
    controller.getCurrentLocation();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Geolocator.requestPermission();
      Timer(Duration(seconds: 3), () {
        Get.offAllNamed(
            AppToken.checkToken() ? RoutePage.home : RoutePage.onBoarding);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(gradient: ColorConstants.gradient['blue1']),
          child: SizedBox(
            width: 100.w,
            height: 100.h,
            child: Center(
              child: SvgPicture.asset('assets/logo/logo.svg'),
            ),
          ),
        ),
      ),
    );
  }
}
