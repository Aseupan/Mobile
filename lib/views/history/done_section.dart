import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/controller/history/history_controller.dart';
import 'package:mobile/views/history/done_card.dart';
import 'package:mobile/views/history/ongoing_card.dart';

class DoneSection extends StatelessWidget {
  final HistoryController controller = HistoryController.i;

  DoneSection({super.key});

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
                children: controller.done
                    .map((element) => DoneCard(data: element))
                    .toList(),
              ),
      ),
    );
  }
}
