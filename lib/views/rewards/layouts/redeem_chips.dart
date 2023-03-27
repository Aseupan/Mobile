import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mobile/controller/global/global_controller.dart';
import 'package:mobile/views/rewards/widgets/redeem_card.dart';
import 'package:mobile/widgets/text_styles.dart';
import 'package:sizer/sizer.dart';

class RedeemChips extends StatelessWidget {
  GlobalController controller = GlobalController.i;
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
        Wrap(
          runSpacing: 20,
          direction: Axis.horizontal,
          children: [
            ...controller.redeems
                .map((data) => RedeemCard(data: data))
                .toList(),
          ],
        )
      ],
    );
  }
}
