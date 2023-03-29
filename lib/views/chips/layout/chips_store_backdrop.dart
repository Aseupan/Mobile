import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/widgets/text_styles.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChipStoreBackdrop extends StatelessWidget {
  const ChipStoreBackdrop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: ColorConstants.gradient[3],
      ),
      height: 200,
      width: 100.w,
      child: Stack(
        children: [
          Positioned(
            bottom: -60,
            right: -30,
            // right: -30,
            child: Image.asset(
              "assets/images/backdrop_chips.png",
              width: 210,
              height: 210,
            ),
            // child: SvgPicture.asset("assets/images/backdrop_credit.svg"),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 58),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Chips Store',
                      style: h1TextStyle(
                        weight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  'Buy some additional\nchips here!',
                  style: h5TextStyle(
                    weight: FontWeight.w500,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
