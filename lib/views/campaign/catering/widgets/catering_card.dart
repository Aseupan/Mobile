import 'package:flutter/material.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/widgets/text_styles.dart';

class CateringCard extends StatefulWidget {
  final int id;
  final int catering;
  void Function(int e) onChanged;

  CateringCard(
      {super.key,
      required this.id,
      required this.catering,
      required this.onChanged});

  @override
  State<CateringCard> createState() => _CateringCardState();
}

class _CateringCardState extends State<CateringCard> {
  int s = 1;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged(widget.id);
      },
      child: Container(
        padding: EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Radio(
              value: widget.id,
              groupValue: widget.catering,
              onChanged: (e) {
                widget.onChanged(widget.id);
              },
              visualDensity: VisualDensity.compact,
            ),
            SizedBox(width: 5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Catering GSC Barokah',
                    style: body5TextStyle(
                      weight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '(+62) 812-3456-7890',
                    style: body6TextStyle(
                      color: ColorConstants.slate[400],
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Jl. Bunga Coklat No. 35\nLowokwaru, Kota Malang, Jawa Timur, 65115',
                    style: body6TextStyle(
                      weight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
