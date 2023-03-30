import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/routes/app_routes.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/widgets/text_styles.dart';
import 'package:sizer/sizer.dart';

class CardCampaign extends StatefulWidget {
  int status = 0;
  int needs;
  int current;
  /*
    0 = gaada status
    1 = urgent needed
    2 = almost done
  */
  CardCampaign({
    super.key,
    required this.status,
    required this.current,
    required this.needs,
  });

  @override
  State<CardCampaign> createState() => _CardCampaignState();
}

class _CardCampaignState extends State<CardCampaign> {
  Widget Status() {
    int status = widget.status;
    switch (status) {
      case 0:
        return SizedBox(
          width: 0,
          height: 0,
        );
      default:
        return Positioned(
          top: 0,
          left: 0,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(7),
                    topLeft: Radius.circular(5),
                  ),
                  color: ColorConstants.secondary[500],
                ),
                width: status == 1 ? 115 : 102,
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(7),
                  ),
                  color: ColorConstants.error,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 4,
                ),
                child: Text(
                  status == 1 ? 'URGENT NEEDED' : 'ALMOST DONE',
                  style: body6TextStyle(
                    weight: FontWeight.bold,
                    color: ColorConstants.slate[25],
                  ),
                ),
              ),
            ],
          ),
        );
    }

    // return Text('widget.status');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RoutePage.campaignDetail(1));
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
                child: Image(
                  image: AssetImage('assets/images/dummy_campaign.jpg'),
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
                        value: widget.current / widget.needs,
                        color: ColorConstants.primary[600],
                        backgroundColor: ColorConstants.slate[200],
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "${widget.current} boxes food of ${widget.needs} boxes",
                      style: body6TextStyle(color: ColorConstants.slate[500]),
                    ),
                    SizedBox(height: 3),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
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
                          'until March 1st 2023',
                          style: TextStyle(
                            color: ColorConstants.slate[400],
                            fontWeight: FontWeight.w600,
                            fontSize: 9,
                          ),
                        )
                      ],
                    ),
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
