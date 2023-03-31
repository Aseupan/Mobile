import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/widgets/text_styles.dart';

class CardAddress extends StatelessWidget {
  final String name;
  final String phone;
  final String address;
  const CardAddress({
    super.key,
    required this.address,
    required this.name,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: body5TextStyle(
              weight: FontWeight.bold,
            ),
          ),
          Text(
            phone,
            style: body6TextStyle(
              color: ColorConstants.slate[400],
            ),
          ),
          SizedBox(height: 13),
          Text(
            address,
            style: body6TextStyle(
              weight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
