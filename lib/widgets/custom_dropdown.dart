import 'package:flutter/material.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/widgets/text_styles.dart';

class CustomDropdown extends StatelessWidget {
  TextEditingController controller;
  String placeholder = "";
  List<Map<String, String>> menu;
  String? label;

  CustomDropdown({
    super.key,
    required this.controller,
    this.placeholder = "",
    required this.menu,
    this.label = "",
  });

  Widget RenderLabel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label!,
          style: body5TextStyle(weight: FontWeight.w500),
        ),
        SizedBox(height: 6),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    print(menu);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null ? RenderLabel() : Container(),
        DropdownButtonFormField(
          hint: Text(
            placeholder,
            style: body5TextStyle(
              color: ColorConstants.slate[400],
            ),
          ),
          style: body5TextStyle(weight: FontWeight.w500),
          items: menu
              .map(
                (e) => DropdownMenuItem(
                  value: e['value'] ?? '',
                  child: Text(e['text'] ?? ''),
                ),
              )
              .toList(),
          onChanged: (e) {
            controller.text = e!;
          },
        ),
      ],
    );
  }
}
