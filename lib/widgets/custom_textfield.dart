// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mobile/widgets/text_styles.dart';

class CustomTextfield extends StatelessWidget {
  String label;
  TextEditingController controller;
  String? Function(String?)? validator;
  String placeholder;
  void Function(String)? onChange;
  TextInputType? keyboardType = TextInputType.text;
  int maxLines = 1;
  Widget? action;
  bool readOnly;

  CustomTextfield({
    super.key,
    required this.label,
    required this.controller,
    required this.placeholder,
    this.onChange,
    this.validator,
    this.keyboardType,
    this.maxLines = 1,
    this.action,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: body5TextStyle(weight: FontWeight.w500),
            ),
            action ?? Container(),
          ],
        ),
        SizedBox(height: 6),
        TextFormField(
          readOnly: readOnly,
          decoration: InputDecoration(hintText: placeholder),
          controller: controller,
          style: body5TextStyle(weight: FontWeight.w500),
          onChanged: onChange,
          validator: validator,
          keyboardType: keyboardType,
          maxLines: maxLines,
        ),
      ],
    );
  }
}
