import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/controller/chips/chips_controller.dart';
import 'package:mobile/services/api/get_api_service.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/utils/format_rupiah.dart';
import 'package:mobile/views/chips/widgets/edit_cart_card.dart';
import 'package:mobile/widgets/custom_appbar.dart';
import 'package:mobile/widgets/text_styles.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  var controller = ChipsController.i;

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
      appBar: CustomAppBar("My Cart"),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Total Purchase',
                  style: body5TextStyle(
                    color: ColorConstants.slate[400],
                    weight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Obx(
                  () => Text(
                    formatToRupiah(controller.total.value),
                    style: body1TextStyle(
                      weight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 25,
              horizontal: 30,
            ),
            child: Obx(
              () => Wrap(
                runSpacing: 15,
                children: controller.carts
                    .map((data) => EditCartCard(data: data))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
