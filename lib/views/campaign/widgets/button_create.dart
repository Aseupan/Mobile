import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobile/routes/app_routes.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/widgets/text_styles.dart';

class ButtonCampaign extends StatelessWidget {
  const ButtonCampaign({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(30, 136, 229, 0.3),
                offset: Offset(0, 9),
                blurRadius: 25,
              )
            ],
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            ),
            onPressed: () {
              Get.toNamed(RoutePage.createCampaign);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Create Your Campaign!",
                  style: h5TextStyle(
                    color: Colors.white,
                    weight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.add,
                  size: 18,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 25),
      ],
    );
  }
}
