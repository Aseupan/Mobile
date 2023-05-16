import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/controller/history/history_controller.dart';
import 'package:mobile/views/history/ongoing_card.dart';

class OngoingSection extends StatelessWidget {
  final HistoryController controller = HistoryController.i;

  OngoingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        child: controller.isLoadingOngoing.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                padding: EdgeInsets.symmetric(horizontal: 20),
                children: controller.ongoing
                    .map((element) => OngoingCard(data: element))
                    .toList(),
              ),
      ),
    );
  }
}
