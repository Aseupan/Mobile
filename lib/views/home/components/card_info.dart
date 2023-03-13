import 'package:flutter/material.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/widgets/text_styles.dart';
import 'package:sizer/sizer.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Image(
              image: AssetImage('assets/images/dummy_card_blog.jpg'),
              width: 75,
              height: 75,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: ColorConstants.gradient['blue1'],
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                  child: Text(
                    'Blog',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                  style: body6TextStyle(
                    color: ColorConstants.slate[900],
                    weight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 7),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_month_outlined,
                      size: 12,
                      color: ColorConstants.slate[400],
                    ),
                    SizedBox(width: 8),
                    Text(
                      'March 1st 2023',
                      style: TextStyle(
                        color: ColorConstants.slate[400],
                        fontWeight: FontWeight.w600,
                        fontSize: 8,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
