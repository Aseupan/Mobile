import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/controller/campaign/campaign_controller.dart';
import 'package:mobile/controller/campaign/types/food_detail.dart';
import 'package:mobile/routes/app_routes.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/widgets/control_counter.dart';
import 'package:mobile/widgets/custom_appbar.dart';
import 'package:mobile/widgets/pick_image_ocr.dart';
import 'package:mobile/widgets/text_styles.dart';
import 'package:mobile/widgets/tips.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';
import 'package:mobile/views/campaign/widgets/insert_image.dart';

class FoodCampaignScreen extends StatefulWidget {
  const FoodCampaignScreen({super.key});

  @override
  State<FoodCampaignScreen> createState() => _FoodCampaignScreenState();
}

class _FoodCampaignScreenState extends State<FoodCampaignScreen> {
  final id = Get.parameters['campaignId']!.substring(1);

  DateTime _selectedDate = DateTime.now();
  final _dateController = TextEditingController();
  final _controller = CampaignController.i;
  bool isAvailable = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!_controller.foodDetails.containsKey(id)) {
        _controller.foodDetails[id] = FoodDetail();
      }
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = DateFormat.yMd().format(_selectedDate);
      });
      _controller.foodDetails[id]?.expired.value = _dateController.text;
    }
  }

  Widget dialog(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.only(left: 5.w, right: 5.w),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Before you send it,',
              style: h3TextStyle(
                weight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Are you sure your food packaging is safe enough to arrive safely?',
              style: h5TextStyle(color: ColorConstants.slate[400]),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'I’m not sure',
                    style: h5TextStyle(
                      color: ColorConstants.slate[600],
                      weight: FontWeight.w500,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Get.toNamed(RoutePage.pickupDetail(num.parse(id)));
                  },
                  child: Text(
                    'I’m sure, next',
                    style: h5TextStyle(
                      weight: FontWeight.w500,
                      color: ColorConstants.slate[25],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  List<File> a = <File>[];

  @override
  Widget build(BuildContext context) {
    print(a.length);

    return Scaffold(
      backgroundColor: ColorConstants.slate[25],
      appBar: CustomAppBar("Food Details"),
      body: SingleChildScrollView(
        child: Container(
          width: 100.w,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Food Type",
                style: body5TextStyle(
                  color: ColorConstants.slate[900],
                  weight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 6),
              DropdownButtonFormField(
                hint: Text(
                  'Choose Food Type',
                  style: body5TextStyle(),
                ),
                style: body5TextStyle(weight: FontWeight.w500),
                items: ['Dry Food', 'Food Dry']
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ),
                    )
                    .toList(),
                onChanged: (e) {
                  _controller.foodDetails[id]?.foodType.value = e!;
                  _controller.foodDetails[id]?.checkValid();
                },
              ),
              SizedBox(height: 20),
              Text(
                'Description',
                style: h5TextStyle(
                  color: ColorConstants.slate[900],
                  weight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 5),
              TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  hintText: 'Snack, Rice box, Water, etc..',
                ),
                style: body5TextStyle(),
                onChanged: (e) {
                  _controller.foodDetails[id]?.description.value = e;
                  _controller.foodDetails[id]?.checkValid();
                },
              ),
              SizedBox(height: 20),
              Obx(
                () => ControlCounter(
                  value: _controller.foodDetails[id]?.quantity.value ?? 0,
                  label: 'Quantity',
                  unit: 'Pcs',
                  onChange: (e) {
                    _controller.foodDetails[id]?.quantity.value = e;
                  },
                ),
              ),
              SizedBox(height: 20),
              Obx(
                () => ControlCounter(
                  value: _controller.foodDetails[id]?.weight.value ?? 0,
                  label: 'Weight',
                  unit: 'Kg',
                  onChange: (e) {
                    _controller.foodDetails[id]?.weight.value = e;
                  },
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Expired Date (optional)",
                style: body5TextStyle(
                  color: ColorConstants.slate[900],
                  weight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 7),
              TextField(
                style: body5TextStyle(color: ColorConstants.slate[900]),
                controller: _dateController,
                decoration: InputDecoration(
                  hintText: "Example : 01/01/2024",
                ),
                readOnly: true,
                onTap: () async {
                  await _selectDate(context);
                  _controller.foodDetails[id]?.checkValid();
                },
              ),
              SizedBox(height: 18),
              PickImageOcr(),
              SizedBox(height: 20),
              Tips(),
              SizedBox(height: 35),
              Obx(
                () => ElevatedButton(
                  onPressed: _controller.foodDetails[id]?.isValid.value ?? false
                      ? () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  dialog(context));
                        }
                      : null,
                  child: Text(
                    'Proceed to Shiping',
                    style: h4TextStyle(
                      color: Colors.white,
                      weight: FontWeight.w600,
                    ),
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
