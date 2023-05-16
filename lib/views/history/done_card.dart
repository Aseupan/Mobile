import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/models/history/history_model.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/widgets/text_styles.dart';

class DoneCard extends StatelessWidget {
  final HistoryModel data;
  const DoneCard({
    super.key,
    required this.data,
  });

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
                data.category == 1
                    ? "assets/icons/box_donate.svg"
                    : "assets/logo/logo-blue.svg",
                width: 32,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      data.title,
                      overflow: TextOverflow.ellipsis,
                      style: body6TextStyle(
                        weight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      data.CreatedAt,
                      style: TextStyle(
                        fontSize: 9,
                        color: ColorConstants.slate[700],
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
