import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/models/campaign/campaign_model.dart';
import 'package:mobile/routes/app_routes.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/utils/date_formatter.dart';
import 'package:mobile/widgets/text_styles.dart';
import 'package:sizer/sizer.dart';

class CardCampaign extends StatefulWidget {
  final CampaignModel data;
  const CardCampaign({
    super.key,
    required this.data,
  });

  @override
  State<CardCampaign> createState() => _CardCampaignState();
}

class _CardCampaignState extends State<CardCampaign> {
  List<String> thumbnails = <String>[];

  Widget Status() {
    double percentage = widget.data.progress / widget.data.target;
    int status = widget.data.urgent;
    if (status == 1) {
      return Column(
        children: [
          SizedBox(height: 7),
          Container(
            decoration: BoxDecoration(
              color: ColorConstants.error,
              borderRadius: BorderRadius.circular(5),
            ),
            padding: EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 12,
            ),
            child: Text(
              'URGENTLY NEEDED!',
              style: TextStyle(
                fontSize: 10,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      );
    } else if (percentage > 0.8) {
      return Column(
        children: [
          SizedBox(height: 7),
          Container(
            decoration: BoxDecoration(
              color: ColorConstants.error,
              borderRadius: BorderRadius.circular(5),
            ),
            padding: EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 12,
            ),
            child: Text(
              'ALMOST DONE!',
              style: TextStyle(
                fontSize: 10,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      );
    } else {
      return SizedBox(
        width: 0,
        height: 0,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.data.thumbnail_1 != "") thumbnails.add(widget.data.thumbnail_1);
    if (widget.data.thumbnail_2 != "") thumbnails.add(widget.data.thumbnail_2);
    if (widget.data.thumbnail_3 != "") thumbnails.add(widget.data.thumbnail_3);
    if (widget.data.thumbnail_4 != "") thumbnails.add(widget.data.thumbnail_4);
    if (widget.data.thumbnail_5 != "") thumbnails.add(widget.data.thumbnail_5);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RoutePage.campaignDetail(widget.data.id));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(7)),
        child: Container(
          width: 100.w,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [ColorConstants.shadow[1]!],
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(7),
                  bottomRight: Radius.circular(7),
                ),
                child: Image.network(
                  thumbnails[0],
                  width: 100.w,
                  height: 130,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 19,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      child: LinearProgressIndicator(
                        minHeight: 5,
                        value: widget.data.progress / widget.data.target,
                        color: ColorConstants.primary[600],
                        backgroundColor: ColorConstants.slate[200],
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "${widget.data.progress} boxes food of ${widget.data.target} boxes",
                      style: body6TextStyle(color: ColorConstants.slate[500]),
                    ),
                    SizedBox(height: 3),
                    Text(
                      widget.data.name,
                      style: body6TextStyle(
                        weight: FontWeight.w700,
                        color: ColorConstants.slate[900],
                      ),
                    ),
                    SizedBox(height: 7),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month_outlined,
                          size: 10,
                          color: ColorConstants.slate[400],
                        ),
                        SizedBox(width: 8),
                        Text(
                          'until ${formatDateToString(widget.data.end_date!)} | 15.00 UTC+7',
                          style: TextStyle(
                            color: ColorConstants.slate[400],
                            fontWeight: FontWeight.w600,
                            fontSize: 9,
                          ),
                        )
                      ],
                    ),
                    Status(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
