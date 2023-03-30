import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/controller/chips/chips_controller.dart';
import 'package:mobile/controller/global/global_controller.dart';
import 'package:mobile/services/api/get_api_service.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/views/chips/layout/chips_store_backdrop.dart';
import 'package:mobile/views/chips/widgets/chips_card.dart';
import 'package:mobile/views/chips/widgets/cart_popup.dart';

class ChipsStoreScreen extends StatefulWidget {
  const ChipsStoreScreen({super.key});

  @override
  State<ChipsStoreScreen> createState() => _ChipsStoreScreenState();
}

class _ChipsStoreScreenState extends State<ChipsStoreScreen> {
  var globalController = GlobalController.i;
  ChipsController controller = ChipsController.i;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      GetApiService.getCart();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        ChipStoreBackdrop(),
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 160,
              ),
              Container(
                  decoration: BoxDecoration(
                    color: ColorConstants.slate[25],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 30,
                    horizontal: 30,
                  ),
                  child: Column(
                    children: [
                      Wrap(
                        runSpacing: 15,
                        children: globalController.chips
                            .map((data) => ChipsCard(data: data))
                            .toList(),
                      ),
                      SizedBox(height: 20),
                      Obx(
                        () => controller.carts.isNotEmpty
                            ? CartPopup()
                            : Container(),
                      ),
                    ],
                  ))
            ],
          ),
        ),
        Positioned(
          top: 50,
          right: 40,
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.close,
              size: 24,
              color: Colors.white,
            ),
          ),
        ),
      ]),
    );
  }
}
