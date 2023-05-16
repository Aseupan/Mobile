import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile/controller/history/history_controller.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/views/history/done_section.dart';
import 'package:mobile/views/history/ongoing_section.dart';
import 'package:mobile/widgets/bottom_bar/bottom_bar.dart';
import 'package:mobile/widgets/custom_appbar.dart';
import 'package:mobile/widgets/text_styles.dart';
import 'package:sizer/sizer.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  HistoryController controller = HistoryController.i;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [ColorConstants.shadow[1]!],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 60,
                    bottom: 10,
                    left: 25,
                    right: 25,
                  ),
                  child: Text(
                    'History',
                    style: h1TextStyle(
                      weight: FontWeight.w800,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          controller.isDone.value = false;
                        },
                        child: Obx(
                          () => Container(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: controller.isDone.value
                                    ? BorderSide.none
                                    : BorderSide(
                                        color: ColorConstants.flowerBlue[600]!,
                                        width: 2,
                                      ),
                              ),
                            ),
                            width: 100.w,
                            child: Text(
                              'Ongoing',
                              textAlign: TextAlign.center,
                              style: h5TextStyle(
                                weight: FontWeight.w600,
                                color: controller.isDone.value
                                    ? ColorConstants.slate[300]
                                    : ColorConstants.flowerBlue[600],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          controller.isDone.value = true;
                        },
                        child: Obx(
                          () => Container(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: !controller.isDone.value
                                    ? BorderSide.none
                                    : BorderSide(
                                        color: ColorConstants.flowerBlue[600]!,
                                        width: 2,
                                      ),
                              ),
                            ),
                            width: 100.w,
                            child: Text(
                              'Done',
                              textAlign: TextAlign.center,
                              style: h5TextStyle(
                                weight: FontWeight.w600,
                                color: !controller.isDone.value
                                    ? ColorConstants.slate[300]
                                    : ColorConstants.flowerBlue[600],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Obx(
            () => controller.isDone.value ? DoneSection() : OngoingSection(),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomAppbar(
        index: 3,
      ),
    );
  }
}
