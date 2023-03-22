import 'package:flutter/material.dart';
import 'package:mobile/widgets/custom_appbar.dart';
import 'package:mobile/views/address/widget/address_card.dart';
import 'package:mobile/widgets/text_styles.dart';

class MyAddressScreen extends StatelessWidget {
  const MyAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('My Address'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          child: Column(
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
              SizedBox(height: 30),
              ElevatedButton(
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
