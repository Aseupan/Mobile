import 'package:flutter/material.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/widgets/text_styles.dart';

class SenderAddressCard extends StatelessWidget {
  const SenderAddressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sender Address',
          style: body5TextStyle(
            weight: FontWeight.bold,
            color: ColorConstants.slate[900],
          ),
        ),
        SizedBox(height: 10),
        // Card Sender Address
        Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Jennifer Laurent',
                          style: body5TextStyle(
                            weight: FontWeight.bold,
                            color: ColorConstants.slate[900],
                          ),
                        ),
                        Container(
                          width: 1,
                          height: 13,
                          decoration: BoxDecoration(
                            color: ColorConstants.slate[400],
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        Text(
                          '(+62) 812-3456-7890',
                          style: body6TextStyle(
                            color: ColorConstants.slate[400],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 13),
                    Text(
                      'Jl. Soekarno Hatta No. 170\nKlojen, Kota Malang, Jawa Timur, 65115',
                      style: body6TextStyle(
                        color: ColorConstants.slate[900],
                        weight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 12),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: ColorConstants.flowerBlue[600],
                      ),
                      child: Text(
                        'Primary',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                color: ColorConstants.slate[300],
                height: 1,
                thickness: 1,
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Not this? Change address',
                        style: TextStyle(
                          fontSize: 10,
                          color: ColorConstants.slate[500],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: ColorConstants.slate[500],
                        size: 18,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
