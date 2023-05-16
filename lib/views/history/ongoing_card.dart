import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/models/history/ongoing_model.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/widgets/text_styles.dart';

class OngoingCard extends StatelessWidget {
  final OngoingModel data;
  const OngoingCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Container(
          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(7),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                "assets/icons/box_donate.svg",
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Donate for ${data.campaign.name}",
                      overflow: TextOverflow.ellipsis,
                      style: body6TextStyle(
                        weight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      "Status: Pickup\nEstimated Time: 20 min",
                      style: TextStyle(
                        fontSize: 9,
                        color: ColorConstants.slate[600],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
