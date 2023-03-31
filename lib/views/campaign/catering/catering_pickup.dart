import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobile/controller/campaign/campaign_controller.dart';
import 'package:mobile/controller/campaign/catering_controller.dart';
import 'package:mobile/controller/global/global_controller.dart';
import 'package:mobile/services/api/get_api_service.dart';
import 'package:mobile/services/api/post_api_service.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/views/campaign/catering/widgets/card_address.dart';
import 'package:mobile/views/rewards/layouts/more_chips.dart';
import 'package:mobile/widgets/custom_appbar.dart';
import 'package:mobile/widgets/text_styles.dart';
import 'package:sizer/sizer.dart';
import 'package:mobile/models/catering/catering_model.dart';

class CateringPickupScreen extends StatefulWidget {
  const CateringPickupScreen({super.key});

  @override
  State<CateringPickupScreen> createState() => _CateringPickupScreenState();
}

class _CateringPickupScreenState extends State<CateringPickupScreen> {
  var id = Get.parameters['id'];
  CateringController controller = CateringController.i;
  GlobalController globalController = GlobalController.i;
  CampaignController campaignController = CampaignController.i;
  int? method;
  Map<String, dynamic> formData = <String, dynamic>{
    "pickup": 0,
    "additional_chips": []
  };

  bool isAgree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Pick Up Details"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Catering Address',
                style: body5TextStyle(
                  weight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Obx(
                () {
                  var data = controller.caterings.firstWhere(
                      (element) => element.id == controller.cateringId.value);

                  return CardAddress(
                    address: data.address,
                    name: data.name,
                    phone: data.phone,
                  );
                },
              ),
              SizedBox(height: 20),
              Text(
                'Receiver',
                style: body5TextStyle(
                  weight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              CardAddress(
                address:
                    "Jl. Veteran No. 190\nKlojen, Kota Malang, Jawa Timur, 65115",
                name: "Yayasan Adihusada Malang",
                phone: "(+62) 812-3456-7890",
              ),
              SizedBox(height: 20),
              Text(
                'Pick Up Method',
                style: body5TextStyle(
                  weight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Aseupan Food PickUp',
                          style: body5TextStyle(
                            weight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'FREE',
                          style: body6TextStyle(
                            color: ColorConstants.slate[400],
                            weight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: ColorConstants.slate[200],
                      thickness: 1,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          formData["pickup"] = 1;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Radio(
                                value: 1,
                                groupValue: formData["pickup"],
                                onChanged: (e) {
                                  setState(() {
                                    formData["pickup"] = e;
                                  });
                                },
                                visualDensity: VisualDensity.compact,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                              ),
                              Text(
                                'Motorcycle',
                                style: body5TextStyle(
                                  weight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'For 1 - 10 Box',
                            style: body6TextStyle(
                              color: ColorConstants.slate[400],
                              weight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: ColorConstants.slate[200],
                      thickness: 1,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          formData["pickup"] = 2;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Radio(
                                value: 2,
                                groupValue: formData["pickup"],
                                onChanged: (e) {
                                  setState(() {
                                    formData["pickup"] = e;
                                  });
                                },
                                visualDensity: VisualDensity.compact,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                              ),
                              Text(
                                'Car',
                                style: body5TextStyle(
                                  weight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'For > 10 Box',
                            style: body6TextStyle(
                              color: ColorConstants.slate[400],
                              weight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Chips Additional',
                        style: body5TextStyle(weight: FontWeight.bold),
                      ),
                      SizedBox(width: 5),
                      Obx(
                        () => RichText(
                          text: TextSpan(
                              text: "( My Chips ",
                              style: body6TextStyle(
                                color: ColorConstants.slate[500],
                                weight: FontWeight.w600,
                              ),
                              children: [
                                WidgetSpan(
                                  child: SvgPicture.asset(
                                    "assets/icons/chips-circle.svg",
                                    width: 12,
                                  ),
                                ),
                                TextSpan(
                                    text:
                                        " ${globalController.profile.value.point} )")
                              ]),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Checkbox(
                                  value:
                                      formData['additional_chips'].contains(1),
                                  onChanged: (e) {
                                    if (e!) {
                                      setState(() {
                                        formData['additional_chips'].add(1);
                                      });
                                    } else {
                                      setState(() {
                                        formData['additional_chips'].remove(1);
                                      });
                                    }
                                  },
                                ),
                                Text(
                                  "Special Packaging",
                                  style: body5TextStyle(
                                    weight: FontWeight.w500,
                                    color: ColorConstants.slate[800],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 2,
                              ),
                              constraints: BoxConstraints(
                                minWidth: 55,
                              ),
                              decoration: BoxDecoration(
                                color: ColorConstants.slate[50],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/chips-circle.svg",
                                    width: 12,
                                  ),
                                  SizedBox(width: 2),
                                  Text(
                                    '120',
                                    style: body6TextStyle(
                                      weight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Divider(
                          color: ColorConstants.slate[300],
                          thickness: 1.2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Checkbox(
                                  value:
                                      formData['additional_chips'].contains(2),
                                  onChanged: (e) {
                                    if (e!) {
                                      setState(() {
                                        formData['additional_chips'].add(2);
                                      });
                                    } else {
                                      setState(() {
                                        formData['additional_chips'].remove(2);
                                      });
                                    }
                                  },
                                ),
                                Text(
                                  "Additional Snack",
                                  style: body5TextStyle(
                                    weight: FontWeight.w500,
                                    color: ColorConstants.slate[800],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 2,
                              ),
                              constraints: BoxConstraints(
                                minWidth: 55,
                              ),
                              decoration: BoxDecoration(
                                color: ColorConstants.slate[50],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/chips-circle.svg",
                                    width: 12,
                                  ),
                                  SizedBox(width: 2),
                                  Text(
                                    '75',
                                    style: body6TextStyle(
                                      weight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Divider(
                          color: ColorConstants.slate[300],
                          thickness: 1.2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Checkbox(
                                  value:
                                      formData['additional_chips'].contains(3),
                                  onChanged: (e) {
                                    if (e!) {
                                      setState(() {
                                        formData['additional_chips'].add(3);
                                      });
                                    } else {
                                      setState(() {
                                        formData['additional_chips'].remove(3);
                                      });
                                    }
                                  },
                                ),
                                Text(
                                  "Gift Card",
                                  style: body5TextStyle(
                                    weight: FontWeight.w500,
                                    color: ColorConstants.slate[800],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 2,
                              ),
                              constraints: BoxConstraints(
                                minWidth: 55,
                              ),
                              decoration: BoxDecoration(
                                color: ColorConstants.slate[50],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/chips-circle.svg",
                                    width: 12,
                                  ),
                                  SizedBox(width: 2),
                                  Text(
                                    '50',
                                    style: body6TextStyle(
                                      weight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  MoreChips(),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Checkbox(
                        value: isAgree,
                        onChanged: (e) {
                          setState(() {
                            isAgree = e!;
                          });
                        },
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity: VisualDensity.compact,
                      ),
                      SizedBox(width: 2),
                      Expanded(
                        child: Text(
                          'By agreeing to this, I am willing to take responsibility for all the food that I provide.',
                          style: body5TextStyle(
                            weight: FontWeight.w500,
                            size: 12.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: isAgree && formData['pickup'] != 0
                        ? () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    child: SizedBox(
                                      height: 200,
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            CircularProgressIndicator(),
                                            SizedBox(height: 15),
                                            Text('Donating ...')
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                });
                            PostApiService.createDonationCatering(
                                formData, id!, controller.cateringId.value);
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(100.w, 40),
                    ),
                    child: Text("Donate My Food Now!"),
                  ),
                  SizedBox(height: 10),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
