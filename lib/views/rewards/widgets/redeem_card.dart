import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/models/reward/redeem_reward_model.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/widgets/text_styles.dart';
import 'package:sizer/sizer.dart';

class RedeemCard extends StatelessWidget {
  RedeemRewardModel data;
  RedeemCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 14,
        horizontal: 18,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(data.name.toLowerCase().contains("spotify")
                  ? "assets/icons/spotify.svg"
                  : "assets/icons/youtube.svg"),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 43.w,
                    child: Text(
                      data.name,
                      style: body6TextStyle(
                        weight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 1),
                  Text(
                    '${data.quantity} left',
                    style: TextStyle(
                      fontSize: 8,
                      color: ColorConstants.slate[400],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorConstants.slate[50],
            ),
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 11),
            child: Row(
              children: [
                SvgPicture.asset("assets/icons/chips-circle.svg"),
                SizedBox(width: 2),
                Text(
                  "${data.points}",
                  style: body6TextStyle(weight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
