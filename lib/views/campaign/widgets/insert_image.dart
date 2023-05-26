import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/controller/campaign/campaign_controller.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/utils/image_picker.dart';
import 'package:mobile/widgets/text_styles.dart';
import 'package:sizer/sizer.dart';

class InsertImage extends StatefulWidget {
  const InsertImage({super.key});

  @override
  State<InsertImage> createState() => _InsertImageState();
}

class _InsertImageState extends State<InsertImage> {
  TextStyle defaultStyle = body5TextStyle(weight: FontWeight.w500);
  CampaignController controller = CampaignController.i;
  List<File> images = <File>[];

  String extractFilename(String path) {
    List<String> parts = path.split('/');

    String filename = parts.last;
    if (filename.startsWith('scaled_')) {
      filename = filename.substring(7);
    }
    return filename;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Insert Image',
          style: defaultStyle,
        ),
        SizedBox(height: 6),
        GestureDetector(
          onTap: () async {
            var inputan = await pickMultiImage(max: 5);
            setState(() {
              images = inputan;
              for (int i = 1; i <= 5; i++) {
                controller.data['thumbnail$i'] = "";
              }

              for (int i = 0; i < images.length; i++) {
                controller.data['thumbnail${i + 1}'] = images[i].path;
              }
            });
          },
          child: DottedBorder(
            color: ColorConstants.slate[300]!,
            radius: Radius.circular(10),
            dashPattern: [6, 6],
            child: SizedBox(
              width: 100.w,
              height: 80,
              child: Center(
                child: SvgPicture.asset(
                  "assets/icons/plus.svg",
                  width: 26,
                  height: 26,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 6),
        Text(
          'Insert your image up to 5 slides max 1 MB per image with size 300 x 130 px',
          style: body5TextStyle(
            color: ColorConstants.slate[400],
            weight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 13),
        Wrap(
          runSpacing: 4,
          children: images.map((e) {
            String path = extractFilename(e.path);
            // print(e.runtimeType);
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 70.w,
                  child: Text(
                    path,
                    overflow: TextOverflow.ellipsis,
                    style: defaultStyle,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    var copyofImages = images.map((e) => e).toList();
                    copyofImages
                        .removeWhere((element) => element.path == e.path);
                    setState(() {
                      images = copyofImages;
                    });
                  },
                  child: Icon(
                    Icons.cancel,
                    color: ColorConstants.slate[300],
                    size: 14,
                  ),
                ),
              ],
            );
          }).toList(),
        )
      ],
    );
  }
}
