import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/controller/global/global_controller.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/views/campaign/widgets/button_create.dart';
import 'package:mobile/views/campaign/widgets/card_campaign.dart';
import 'package:mobile/widgets/custom_appbar.dart';
import 'package:mobile/widgets/text_styles.dart';

class CampaignListScreen extends StatefulWidget {
  const CampaignListScreen({super.key});

  @override
  State<CampaignListScreen> createState() => _CampaignListScreenState();
}

class _CampaignListScreenState extends State<CampaignListScreen> {
  var controller = GlobalController.i;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('Campaign'),
      backgroundColor: ColorConstants.slate[25],
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Sort by: ',
                    style: h5TextStyle(
                      color: ColorConstants.slate[500],
                      weight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: 10),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      minimumSize: Size.zero,
                      padding: EdgeInsets.symmetric(
                        vertical: 2,
                        horizontal: 8,
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Newest',
                      style: body6TextStyle(
                        color: ColorConstants.slate[300],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      minimumSize: Size.zero,
                      padding: EdgeInsets.symmetric(
                        vertical: 2,
                        horizontal: 8,
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Nearby',
                      style: body6TextStyle(
                        color: ColorConstants.slate[300],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              // CardCampaign(status: 2)
              Obx(() => Wrap(
                    direction: Axis.horizontal,
                    runSpacing: 20,
                    children: [
                      ...controller.campaigns.map(
                        (e) => CardCampaign(
                          data: e,
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
      floatingActionButton:
          Obx(() => controller.isAdmin.value ? ButtonCampaign() : Container()),
    );
  }
}
