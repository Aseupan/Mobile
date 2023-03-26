import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mobile/controller/home/home_controller.dart';
import 'package:mobile/views/home/components/card_info.dart';
import 'package:mobile/widgets/text_styles.dart';

class HomeInfoLayout extends StatelessWidget {
  HomeInfoLayout({super.key});

  final controller = HomeController.i;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Info",
          style: h5TextStyle(weight: FontWeight.w800),
        ),
        SizedBox(height: 15),
        Obx(() {
          return Wrap(
            runSpacing: 20,
            children: controller.informations
                .map((element) => CardInfo(
                      data: element,
                    ))
                .toList(),
          );
        })

        // ListView(chi)
      ],
    );
  }
}
