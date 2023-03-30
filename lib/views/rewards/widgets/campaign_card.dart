import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/widgets/text_styles.dart';
import 'package:sizer/sizer.dart';

class CampaignCard extends StatelessWidget {
  const CampaignCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              "assets/images/dummy_reward.jpg",
              fit: BoxFit.cover,
              height: 130,
              width: 100.w,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ends in: ',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/reload_outlined.svg",
                        ),
                        SizedBox(width: 3),
                        Text(
                          '23 h',
                          style: body5TextStyle(
                            weight: FontWeight.w600,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Potential Earn Points :',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset("assets/icons/chips-circle.svg"),
                        Text(
                          '100',
                          style: body5TextStyle(
                            weight: FontWeight.w600,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
