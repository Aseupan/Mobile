import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart' hide FormData hide MultipartFile;
import 'package:mobile/models/detect/detect_model.dart';
import 'package:mobile/services/api/fetch_data.dart';
import 'package:mobile/services/api/request_method.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/utils/image_picker.dart';
import 'package:mobile/widgets/text_styles.dart';
import 'package:sizer/sizer.dart';
import 'package:http_parser/http_parser.dart';
import 'dart:math' as math;

class PickImageOcr extends StatefulWidget {
  const PickImageOcr({super.key});

  @override
  State<PickImageOcr> createState() => _PickImageOcrState();
}

class _PickImageOcrState extends State<PickImageOcr> {
  List<File> image = <File>[];
  List<String> label = <String>[];

  List<Color> labelColor = <Color>[
    Color(0xfffafae6),
    Color(0xffe6e6fa),
    Color(0xfffae6e6),
    Color(0xffeda6a6),
    Color(0xffa6caed),
    Color(0xffededa6),
    Color(0xffcaa6ed),
    Color(0xffa6edca),
  ];

  final rnd = math.Random();

  Color getRandomColor() {
    final index = rnd.nextInt(labelColor.length);
    return labelColor[index];
  }

  void pickImage() async {
    var pickedImage = await pickMultiImage(max: 5);
    List<File> tempImage = List<File>.from(image);

    for (int i = image.length, j = 0;
        i < 5 && j < pickedImage.length;
        i++, j++) {
      tempImage.add(pickedImage[j]);
    }

    setState(() {
      image = tempImage;
    });

    detectImage();
  }

  void detectImage() async {
    if (image.isEmpty) {
      setState(() {
        label = <String>[];
      });
      return;
    }
    var data = FormData.fromMap({
      "photo": await Future.wait(image
          .map(
            (element) async => MultipartFile.fromBytes(
              await element.readAsBytes(),
              filename: element.path,
              contentType: MediaType("image", element.path.split(".").last),
            ),
          )
          .toList())
    });

    var response = await fetchMultipleData<DetectModel>(
      url: "api/detect",
      method: RequestMethod.POST,
      data: data,
    );

    if (response != null) {
      print(response.data);
      List<String> labelList = [];
      for (var item in response.data ?? []) {
        print(item);
        List<dynamic> labels = item.labels;
        labelList.addAll(labels.map((label) => label.toString()));
      }

      setState(() {
        label = labelList;
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    print(label);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Insert Image",
          style: body5TextStyle(weight: FontWeight.w500),
        ),
        SizedBox(height: 6),
        GestureDetector(
          onTap: pickImage,
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
        SizedBox(height: 12),
        image.isEmpty
            ? Container()
            : SizedBox(
                height: 140,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: image.length,
                  separatorBuilder: (context, index) => Container(
                    width: 0.8,
                    color: ColorConstants.slate[300],
                    margin: EdgeInsets.symmetric(horizontal: 5),
                  ),
                  itemBuilder: (context, index) => Stack(
                    children: [
                      Image.file(image[index]),
                      Positioned(
                        top: 2,
                        right: 3,
                        child: GestureDetector(
                          onTap: () {
                            var copyofImages = List<File>.from(image);
                            copyofImages.removeWhere(
                                (element) => element.path == image[index].path);

                            setState(() {
                              image = copyofImages;
                            });
                            detectImage();
                          },
                          child: Container(
                            padding: EdgeInsets.all(1.5),
                            decoration: BoxDecoration(
                              color:
                                  ColorConstants.slate[800]!.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.close,
                              size: 14,
                              color: ColorConstants.slate[100],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
        SizedBox(height: 12),
        Wrap(
          spacing: 3,
          runSpacing: 4,
          children: label
              .map(
                (e) => Container(
                  padding: EdgeInsets.symmetric(vertical: 1.5, horizontal: 7),
                  decoration: BoxDecoration(
                    color: getRandomColor(),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 9,
                        height: 9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: ColorConstants.slate[700]!,
                            width: 1.8,
                          ),
                        ),
                      ),
                      SizedBox(width: 3),
                      Text(
                        e,
                        style: body6TextStyle(
                          size: 11,
                          weight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        )
      ],
    );
  }
}
