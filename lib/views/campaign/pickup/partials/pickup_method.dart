import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/controller/campaign/masak_controller.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/widgets/text_styles.dart';

class PickupMethod extends StatelessWidget {
  MasakController controller = MasakController.i;

  PickupMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pick Up Method',
          style: body5TextStyle(
            weight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Aseupan Food PickUp',
                    style: body5TextStyle(
                      weight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'FREE',
                    style: body6TextStyle(
                      color: ColorConstants.slate[400],
                      weight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Divider(
                color: ColorConstants.slate[200],
                thickness: 1,
              ),
              InkWell(
                onTap: () {
                  controller.data["pickup"] = 1;
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Obx(
                          () => Radio(
                            value: 1,
                            groupValue: controller.data["pickup"],
                            onChanged: (e) {
                              controller.data["pickup"] = 1;
                            },
                            visualDensity: VisualDensity.compact,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                          ),
                        ),
                        Text(
                          'Motorcycle',
                          style: body5TextStyle(
                            weight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'For 1 - 10 Box',
                      style: body6TextStyle(
                        color: ColorConstants.slate[400],
                        weight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: ColorConstants.slate[200],
                thickness: 1,
              ),
              InkWell(
                onTap: () {
                  controller.data["pickup"] = 2;
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Obx(
                          () => Radio(
                            value: 2,
                            groupValue: controller.data["pickup"],
                            onChanged: (e) {
                              controller.data["pickup"] = 2;
                            },
                            visualDensity: VisualDensity.compact,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                          ),
                        ),
                        Text(
                          'Car',
                          style: body5TextStyle(
                            weight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'For > 10 Box',
                      style: body6TextStyle(
                        color: ColorConstants.slate[400],
                        weight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
