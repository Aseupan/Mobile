import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/widgets/text_styles.dart';

class HelpCenter extends StatelessWidget {
  const HelpCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Help Center',
          style: h5TextStyle(
            weight: FontWeight.w800,
          ),
        ),
        SizedBox(height: 8),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 9, horizontal: 12),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.headset_mic,
                    size: 15,
                  ),
                  SizedBox(width: 18),
                  Expanded(
                    child: Text(
                      'Customer Help Center',
                      style: body6TextStyle(
                        weight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Icon(Icons.chevron_right, size: 20),
                ],
              ),
              Divider(
                thickness: 1,
                color: ColorConstants.slate[400],
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/faq.svg",
                    width: 15,
                  ),
                  SizedBox(width: 18),
                  Expanded(
                    child: Text(
                      'Change Password',
                      style: body6TextStyle(
                        weight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Icon(Icons.chevron_right, size: 20),
                ],
              ),
              Divider(
                thickness: 1,
                color: ColorConstants.slate[400],
              ),
              Row(
                children: [
                  Icon(
                    Icons.language,
                    size: 15,
                  ),
                  SizedBox(width: 18),
                  Expanded(
                    child: Text(
                      'Change Language',
                      style: body6TextStyle(
                        weight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Icon(Icons.chevron_right, size: 20),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
