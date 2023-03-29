import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/widgets/text_styles.dart';

AppBar CustomAppBar(String title,
    {bool canBack = true,
    void Function()? feedback,
    List<Widget> actions = const <Widget>[]}) {
  feedback ??= () {};
  return AppBar(
    leading: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {
            if (canBack) {
              Get.back();
            } else {
              feedback!();
            }
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 20,
          ),
        )
      ],
    ),
    actions: actions,
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
