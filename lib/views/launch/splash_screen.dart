import 'package:flutter/material.dart';
import 'package:mobile/utils/color_contant.dart';
import 'package:mobile/widgets/animation/fadein_left_fadein_right.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _width = 110;
  bool state = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1500), () {
      setState(() {
        _width *= 1.2;
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
              child: Column(
                children: [
                  Center(child: SvgPicture.asset('assets/images/logo.svg')),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        state = true;
                      });
                    },
                    child: Text('asdasd'),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
