import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobile/controller/chips/chips_controller.dart';
import 'package:mobile/services/api/post_api_service.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/utils/format_rupiah.dart';
import 'package:mobile/widgets/custom_appbar.dart';
import 'package:mobile/widgets/text_styles.dart';

class ChipsPurchaseScreen extends StatefulWidget {
  const ChipsPurchaseScreen({super.key});

  @override
  State<ChipsPurchaseScreen> createState() => _ChipsPurchaseScreenState();
}

class _ChipsPurchaseScreenState extends State<ChipsPurchaseScreen> {
  ChipsController controller = ChipsController.i;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Purchase Detais"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 25,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.04),
                      blurRadius: 10,
                      spreadRadius: 10,
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  )),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your Purchase',
                        style: body5TextStyle(
                          color: ColorConstants.slate[400],
                          weight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Obx(
                        () => Text(
                          formatToRupiah(controller.total.value),
                          style: body1TextStyle(weight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SvgPicture.asset(
                        "assets/logo/logo-blue.svg",
                        width: 16,
                        height: 13,
                      ),
                      SizedBox(width: 5),
                      Text(
                        '100 Chips',
                        style: body6TextStyle(weight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  Text(
                    'Payment Method',
                    style: body5TextStyle(
                      weight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 15),
                  InkWell(
                    onTap: () {
                      PostApiService.purchaseChips(1);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          ColorConstants.shadow[1]!,
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                "assets/icons/gopay.png",
                                width: 52,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'GoPay',
                                style: body5TextStyle(
                                  weight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: ColorConstants.slate[100],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.all(1),
                            child: Icon(
                              Icons.chevron_right_rounded,
                              size: 18,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  InkWell(
                    onTap: () {
                      PostApiService.purchaseChips(2);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          ColorConstants.shadow[1]!,
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                "assets/icons/shopeepay.png",
                                height: 25,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'ShopeePay',
                                style: body5TextStyle(
                                  weight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: ColorConstants.slate[100],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.all(1),
                            child: Icon(
                              Icons.chevron_right_rounded,
                              size: 18,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
