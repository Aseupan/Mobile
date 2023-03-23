import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mobile/controller/campaign/campaign_controller.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/widgets/text_styles.dart';

class PickupAggreements extends StatelessWidget {
  PickupAggreements({super.key});

  final id = Get.parameters['campaignId']!.substring(1);
  final _controller = CampaignController.i.pickupState;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Obx(
          () => Checkbox(
            value: _controller[id]?.isAggree.value ?? false,
            onChanged: (e) {
              _controller[id]?.isAggree.value = e!;
            },
          ),
        ),
        Flexible(
          child: Text(
            'By agreeing to this, I am willing to take responsibility for all the food that I provide.',
            style: body6TextStyle(
              weight: FontWeight.w500,
              color: ColorConstants.slate[800],
            ),
          ),
        )
      ],
    );
  }
}
