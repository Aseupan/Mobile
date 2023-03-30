import 'package:flutter/material.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/widgets/text_styles.dart';

class PickupMethod extends StatelessWidget {
  const PickupMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pick Up Method',
          style: body5TextStyle(weight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Aseupan Food PickUp',
                style: body5TextStyle(
                  weight: FontWeight.w600,
                ),
              ),
              Text(
                'FREE',
                style: body6TextStyle(
                  color: ColorConstants.slate[400],
                  weight: FontWeight.bold,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
