import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobile/controller/campaign/campaign_controller.dart';
import 'package:mobile/controller/campaign/masak_controller.dart';
import 'package:mobile/controller/global/global_controller.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/widgets/text_styles.dart';

class ChipsAdditional extends StatefulWidget {
  const ChipsAdditional({super.key});

  @override
  State<ChipsAdditional> createState() => _ChipsAdditionalState();
}

class _ChipsAdditionalState extends State<ChipsAdditional> {
  final id = Get.parameters['campaignId']!.substring(1);
  final _controller = CampaignController.i.pickupState;
  final GlobalController globalController = GlobalController.i;
  MasakController masakController = MasakController.i;

  @override
  Widget build(BuildContext context) {
    print(id);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Chips Additional',
              style: body5TextStyle(weight: FontWeight.bold),
            ),
            SizedBox(width: 5),
            RichText(
              text: TextSpan(
                  text: "( My Chips ",
                  style: body6TextStyle(
                    color: ColorConstants.slate[500],
                    weight: FontWeight.w600,
                  ),
                  children: [
                    WidgetSpan(
                      child: SvgPicture.asset(
                        "assets/icons/chips-circle.svg",
                        width: 12,
                      ),
                    ),
                    TextSpan(text: " ${globalController.profile.value.point} )")
                  ]),
            ),
          ],
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Obx(
                        () => Checkbox(
                          value: masakController.data['additional_chips']
                              .contains(1),
                          onChanged: (e) {
                            if (e!) {
                              setState(() {
                                masakController.data['additional_chips'].add(1);
                              });
                            } else {
                              setState(() {
                                masakController.data['additional_chips']
                                    .remove(1);
                              });
                            }
                          },
                        ),
                      ),
                      Text(
                        "Special Packaging",
                        style: body5TextStyle(
                          weight: FontWeight.w500,
                          color: ColorConstants.slate[800],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 2,
                    ),
                    constraints: BoxConstraints(
                      minWidth: 55,
                    ),
                    decoration: BoxDecoration(
                      color: ColorConstants.slate[50],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/chips-circle.svg",
                          width: 12,
                        ),
                        SizedBox(width: 2),
                        Text(
                          '120',
                          style: body6TextStyle(
                            weight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Divider(
                color: ColorConstants.slate[300],
                thickness: 1.2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Obx(
                        () => Checkbox(
                          value: masakController.data['additional_chips']
                              .contains(2),
                          onChanged: (e) {
                            if (e!) {
                              setState(() {
                                masakController.data['additional_chips'].add(2);
                              });
                            } else {
                              setState(() {
                                masakController.data['additional_chips']
                                    .remove(2);
                              });
                            }
                          },
                        ),
                      ),
                      Text(
                        "Additional Snack",
                        style: body5TextStyle(
                          weight: FontWeight.w500,
                          color: ColorConstants.slate[800],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 2,
                    ),
                    constraints: BoxConstraints(
                      minWidth: 55,
                    ),
                    decoration: BoxDecoration(
                      color: ColorConstants.slate[50],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/chips-circle.svg",
                          width: 12,
                        ),
                        SizedBox(width: 2),
                        Text(
                          '75',
                          style: body6TextStyle(
                            weight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Divider(
                color: ColorConstants.slate[300],
                thickness: 1.2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Obx(
                        () => Checkbox(
                          value: masakController.data['additional_chips']
                              .contains(3),
                          onChanged: (e) {
                            if (e!) {
                              setState(() {
                                masakController.data['additional_chips'].add(3);
                              });
                            } else {
                              setState(() {
                                masakController.data['additional_chips']
                                    .remove(3);
                              });
                            }
                          },
                        ),
                      ),
                      Text(
                        "Gift Card",
                        style: body5TextStyle(
                          weight: FontWeight.w500,
                          color: ColorConstants.slate[800],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 2,
                    ),
                    constraints: BoxConstraints(
                      minWidth: 55,
                    ),
                    decoration: BoxDecoration(
                      color: ColorConstants.slate[50],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/chips-circle.svg",
                          width: 12,
                        ),
                        SizedBox(width: 2),
                        Text(
                          '50',
                          style: body6TextStyle(
                            weight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
