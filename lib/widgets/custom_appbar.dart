import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/widgets/text_styles.dart';

AppBar CustomAppBar(String title) {
  return AppBar(
    leading: Row(
      children: [
        IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 20,
          ),
        )
      ],
    ),
    leadingWidth: 49,
    title: Text(
      title,
      style: h3TextStyle(
        weight: FontWeight.w600,
      ),
    ),
    backgroundColor: ColorConstants.slate[25],
    elevation: 0,
  );
}
