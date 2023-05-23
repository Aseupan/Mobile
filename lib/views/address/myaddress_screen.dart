import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/controller/global/global_controller.dart';
import 'package:mobile/routes/app_routes.dart';
import 'package:mobile/widgets/custom_appbar.dart';
import 'package:mobile/views/address/widget/address_card.dart';
import 'package:mobile/widgets/text_styles.dart';
import 'package:sizer/sizer.dart';

class MyAddressScreen extends StatelessWidget {
  final GlobalController controller = GlobalController.i;
  MyAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('My Address'),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          constraints: BoxConstraints(minHeight: 85.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () {
                  if (controller.address.isEmpty) {
                    return Text('No Address Data, add your address first');
                  }
                  return Wrap(
                    runSpacing: 20,
                    children: controller.address
                        .map(
                          (element) => AddressCard(
                            isPrimary: false,
                            data: element,
                          ),
                        )
                        .toList(),
                  );
                },
              ),
              SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(40),
                ),
                onPressed: () {
                  Get.toNamed(RoutePage.createAddress);
                },
                child: Text(
                  'Add New Address',
                  style: h4TextStyle(
                    color: Colors.white,
                    weight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
