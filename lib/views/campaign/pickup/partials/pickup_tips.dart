import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/widgets/text_styles.dart';

class PickupTips extends StatelessWidget {
  const PickupTips({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 18,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            "assets/images/pickup_tips.svg",
            width: 111,
            height: 69,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tips',
                style: h5TextStyle(
                  weight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 3),
              Text(
                'Before sending your food,\ncheck out this little tips!',
                style: TextStyle(
                  color: ColorConstants.slate[400],
                  fontSize: 10,
                ),
              ),
              SizedBox(height: 6),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  backgroundColor: ColorConstants.flowerBlue[500],
                ),
                onPressed: () {},
                child: Text(
                  'Read more',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 9,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
