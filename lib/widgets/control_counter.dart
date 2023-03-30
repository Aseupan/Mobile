import 'package:flutter/material.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/widgets/text_styles.dart';

class ControlCounter extends StatelessWidget {
  final String label;
  final int value;
  final void Function(int) onChange;
  final String unit;

  const ControlCounter(
      {super.key,
      required this.label,
      required this.value,
      required this.onChange,
      required this.unit});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: body5TextStyle(
            color: ColorConstants.slate[900],
            weight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 5),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(
                  color: ColorConstants.slate[500]!,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: value > 0
                        ? () {
                            onChange(value - 1);
                          }
                        : null,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorConstants.slate[500]!,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Icon(
                        Icons.remove,
                        size: 16,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Text(
                    '$value',
                    style: body4TextStyle(
                      color: ColorConstants.slate[900],
                      weight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 16),
                  InkWell(
                    onTap: () {
                      onChange(value + 1);
                    },
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorConstants.slate[500]!,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Icon(
                        Icons.add,
                        size: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16),
            Text(
              unit,
              style: body5TextStyle(
                weight: FontWeight.w500,
                color: ColorConstants.slate[400],
              ),
            )
          ],
        )
      ],
    );
  }
}
