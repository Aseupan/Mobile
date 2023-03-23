import 'package:flutter/material.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/widgets/text_styles.dart';

class ReceiverAddress extends StatelessWidget {
  const ReceiverAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Receiver',
          style: body5TextStyle(
            weight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Yayasan Adihusada Malang',
                style: body5TextStyle(
                  weight: FontWeight.bold,
                ),
              ),
              Text(
                '(+62) 812-3456-7890',
                style: body6TextStyle(
                  color: ColorConstants.slate[400],
                ),
              ),
              SizedBox(height: 13),
              Text(
                'Jl. Veteran No. 190\nKlojen, Kota Malang, Jawa Timur, 65115',
                style: body6TextStyle(
                  weight: FontWeight.w600,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
