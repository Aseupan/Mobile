import 'package:flutter/material.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/widgets/custom_appbar.dart';
import 'package:mobile/widgets/text_styles.dart';

class PickupDetailScreen extends StatefulWidget {
  const PickupDetailScreen({super.key});

  @override
  State<PickupDetailScreen> createState() => _PickupDetailScreenState();
}

class _PickupDetailScreenState extends State<PickupDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.slate[25],
      appBar: CustomAppBar("Pick Up Details"),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 15,
          ),
          child: Column(
            children: [
              Text(
                'Sender Address',
                style: body5TextStyle(
                  weight: FontWeight.bold,
                  color: ColorConstants.slate[900],
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
