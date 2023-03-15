import 'package:flutter/material.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/views/campaign/widgets/card_campaign.dart';
import 'package:mobile/widgets/text_styles.dart';

class CampaignListScreen extends StatefulWidget {
  const CampaignListScreen({super.key});

  @override
  State<CampaignListScreen> createState() => _CampaignListScreenState();
}

class _CampaignListScreenState extends State<CampaignListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.slate[25],
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Text(
                "Campaign",
                style: h1TextStyle(
                  weight: FontWeight.w800,
                  color: ColorConstants.slate[900],
                ),
              ),
              SizedBox(height: 16),
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
              Wrap(
                direction: Axis.horizontal,
                runSpacing: 20,
                children: [
                  ...[
                    {'status': 1, 'needs': 100, 'current': 65},
                    {'status': 2, 'needs': 100, 'current': 65},
                    {'status': 0, 'needs': 70, 'current': 65},
                    {'status': 0, 'needs': 90, 'current': 65},
                    {'status': 0, 'needs': 100, 'current': 20},
                    {'status': 0, 'needs': 100, 'current': 65},
                  ].map(
                    (e) => CardCampaign(
                      status: e['status']!,
                      current: e['current']!,
                      needs: e['needs']!,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
