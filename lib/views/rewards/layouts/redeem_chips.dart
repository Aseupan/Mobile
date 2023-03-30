import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/controller/global/global_controller.dart';
import 'package:mobile/views/rewards/widgets/redeem_card.dart';
import 'package:mobile/widgets/text_styles.dart';
import 'package:sizer/sizer.dart';

class RedeemChips extends StatelessWidget {
  final GlobalController controller = GlobalController.i;
  RedeemChips({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Redeem Chips',
          style: h5TextStyle(
            weight: FontWeight.w800,
          ),
        ),
        SizedBox(height: 16),
        Obx(
          () => controller.redeems.isEmpty
              ? SizedBox(
                  height: 70,
                  width: 100.w,
                  child: Center(
                    child: Text(
                      'there is no redeem rewards right now. Comeback later',
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : Wrap(
                  runSpacing: 20,
                  direction: Axis.horizontal,
                  children: [
                    ...controller.redeems
                        .map((data) => RedeemCard(data: data))
                        .toList(),
                  ],
                ),
        )
      ],
    );
  }
}
