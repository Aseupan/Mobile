import 'package:flutter/material.dart';
import 'package:mobile/models/home/information_card.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/utils/date_formatter.dart';
import 'package:mobile/widgets/text_styles.dart';

class CardInfo extends StatelessWidget {
  final InformationCard data;

  const CardInfo({super.key, required this.data});

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
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: SizedBox(
              width: 75,
              height: 75,
              child: Image(
                image: NetworkImage(data.thumbnail),
                width: 75,
                height: 75,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(width: 12),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: ColorConstants.gradient['blue1'],
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                  child: Text(
                    data.type,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  data.title,
                  style: body6TextStyle(
                    color: ColorConstants.slate[900],
                    weight: FontWeight.w700,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  data.body,
                  style: body6TextStyle(
                    size: 10,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_month_outlined,
                      size: 12,
                      color: ColorConstants.slate[400],
                    ),
                    SizedBox(width: 8),
                    Text(
                      formatDate(data.CreatedAt),
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
          ),
        ],
      ),
    );
  }
}
