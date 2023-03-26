import 'package:flutter/material.dart';
import 'package:mobile/widgets/custom_appbar.dart';
import 'package:mobile/views/address/widget/address_card.dart';
import 'package:mobile/widgets/text_styles.dart';
import 'package:sizer/sizer.dart';

class MyAddressScreen extends StatelessWidget {
  const MyAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('My Address'),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          constraints: BoxConstraints(minHeight: 90.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Wrap(
                runSpacing: 20,
                children: [
                  AddressCard(isPrimary: true),
                  AddressCard(isPrimary: false),
                  AddressCard(isPrimary: false),
                  AddressCard(isPrimary: false),
                  AddressCard(isPrimary: false),
                ],
              ),
              SizedBox(height: 100),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(40),
                ),
                onPressed: () {},
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
