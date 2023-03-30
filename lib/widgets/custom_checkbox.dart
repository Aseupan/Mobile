// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mobile/widgets/text_styles.dart';

class CustomCheckbox extends StatefulWidget {
  bool value = false;
  String label;
  Function(bool? a, String text) onChanged;
  CustomCheckbox({
    super.key,
    this.value = false,
    required this.label,
    required this.onChanged,
  });

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool value = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        setState(() {
          value = widget.value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          value: value,
          visualDensity: VisualDensity.compact,
          onChanged: (e) {
            widget.onChanged(e, widget.label);
            setState(() {
              value = e!;
            });
          },
        ),
        Text(
          widget.label,
          style: body5TextStyle(
            weight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
