import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/controller/campaign/campaign_controller.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/views/campaign/pickup/partials/chips_additional.dart';
import 'package:mobile/views/campaign/pickup/partials/pickup_aggreement.dart';
import 'package:mobile/views/campaign/pickup/partials/pickup_method.dart';
import 'package:mobile/views/campaign/pickup/partials/pickup_tips.dart';
import 'package:mobile/views/campaign/pickup/partials/receiver_address.dart';
import 'package:mobile/views/campaign/pickup/partials/sender_address.dart';
import 'package:mobile/widgets/custom_appbar.dart';
import 'package:mobile/widgets/text_styles.dart';
import 'package:sizer/sizer.dart';

class PickupDetailScreen extends StatefulWidget {
  const PickupDetailScreen({super.key});

  @override
  State<PickupDetailScreen> createState() => _PickupDetailScreenState();
}

class _PickupDetailScreenState extends State<PickupDetailScreen> {
  final id = Get.parameters['campaignId']!.substring(1);
  final _controller = CampaignController.i.pickupState;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!_controller.containsKey(id)) {
        _controller[id] = PickupDetail();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Pick Up Details"),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SenderAddressCard(),
              SizedBox(height: 20),
              ReceiverAddress(),
              SizedBox(height: 20),
              PickupMethod(),
              SizedBox(height: 20),
              ChipsAdditional(),
              SizedBox(height: 20),
              PickupTips(),
              SizedBox(height: 20),
              PickupAggreements(),
              SizedBox(height: 20),
              Obx(
                () => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(100.w, 40),
                  ),
                  onPressed:
                      _controller[id]?.isAggree.value ?? false ? () {} : null,
                  child: Text(
                    'Donate My Food Now!',
                    style: h4TextStyle(
                      color: Colors.white,
                      weight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
