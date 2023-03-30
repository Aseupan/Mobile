import 'package:flutter/material.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/widgets/text_styles.dart';

class ButtonVerified extends StatelessWidget {
  const ButtonVerified({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: ColorConstants.error,
            borderRadius: BorderRadius.circular(5),
          ),
          padding: EdgeInsets.symmetric(vertical: 9, horizontal: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Verify your account before\nmaking a campaign!',
                style: body6TextStyle(
                  weight: FontWeight.bold,
                  color: ColorConstants.slate[25],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: Colors.white,
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
