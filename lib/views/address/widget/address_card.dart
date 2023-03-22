import 'package:flutter/material.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/widgets/text_styles.dart';

class AddressCard extends StatelessWidget {
  final bool isPrimary;

  AddressCard({super.key, required this.isPrimary});

  final Widget primaryWidget = Container(
    decoration: BoxDecoration(
      color: ColorConstants.flowerBlue[600],
      borderRadius: BorderRadius.circular(2),
    ),
    padding: EdgeInsets.symmetric(
      vertical: 1,
      horizontal: 5,
    ),
    child: Text(
      'Primary',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w800,
        fontSize: 9.5,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  'Jennifer Laurent',
                  overflow: TextOverflow.ellipsis,
                  style: body5TextStyle(weight: FontWeight.bold),
                ),
              ),
              Container(
                width: 1,
                height: 13,
                color: ColorConstants.slate[400],
              ),
              Text(
                '(+62) 812-3456-7890',
                style: body6TextStyle(
                  color: ColorConstants.slate[400],
                ),
              ),
            ],
          ),
          SizedBox(height: 14),
          Text(
            'Jl. Soekarno Hatta No. 170\nKlojen, Kota Malang, Jawa Timur, 65115',
            style: body6TextStyle(weight: FontWeight.w600),
          ),
          SizedBox(height: 13),
          isPrimary ? primaryWidget : Container(),
        ],
      ),
    );
  }
}
