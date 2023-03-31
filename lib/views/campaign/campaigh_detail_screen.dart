import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/controller/campaign/campaign_controller.dart';
import 'package:mobile/controller/global/global_controller.dart';
import 'package:mobile/models/campaign/campaign_model.dart';
import 'package:mobile/services/api/get_api_service.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/utils/date_formatter.dart';
import 'package:mobile/widgets/custom_appbar.dart';
import 'package:mobile/widgets/text_styles.dart';
import 'package:sizer/sizer.dart';
import 'package:mobile/views/campaign/widgets/donate_dialog.dart';

class CampaignDetailScreen extends StatefulWidget {
  const CampaignDetailScreen({super.key});

  @override
  State<CampaignDetailScreen> createState() => _CampaignDetailScreenState();
}

class _CampaignDetailScreenState extends State<CampaignDetailScreen> {
  String id = Get.parameters['campaignId']!.substring(1);
  CampaignController controller = CampaignController.i;
  GlobalController globalController = GlobalController.i;
  late CampaignModel data = globalController.campaigns
      .firstWhere((element) => element.id == int.parse(id));

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!controller.campaignDetail.containsKey(id)) {
        controller.campaignDetail[id] = CampaignModel.init();
      }
      GetApiService.getCampaignById(id);

      CampaignModel data = controller.campaignDetail[id]!;
      // if (data.thumbnail_1 != "") thumbnails.add(data.thumbnail_1);
      // if (data.thumbnail_2 != "") thumbnails.add(data.thumbnail_2);
      // if (data.thumbnail_3 != "") thumbnails.add(data.thumbnail_3);
      // if (data.thumbnail_4 != "") thumbnails.add(data.thumbnail_4);
      // if (data.thumbnail_5 != "") thumbnails.add(data.thumbnail_5);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.slate[25],
      appBar: CustomAppBar("Campaign Details"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
              () => CarouselSlider(
                items: (controller.thumbnailById[id] ?? [])
                    .map(
                      (e) => Container(
                        margin: EdgeInsets.symmetric(horizontal: 7),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Image(
                            image: NetworkImage(e),
                            width: 100.w,
                            height: 130,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                    .toList(),
                options: CarouselOptions(
                  autoPlay: true,
                  enableInfiniteScroll: true,
                  height: 125,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    constraints: BoxConstraints(minHeight: 60.h),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            data.name,
                            style: h3TextStyle(weight: FontWeight.w800),
                          ),
                          SizedBox(height: 15),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.4))
                              ],
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Potential Earn Chips',
                                  style: body6TextStyle(
                                    weight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icons/chips-circle.svg",
                                      width: 12,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      '100',
                                      style: body6TextStyle(
                                        weight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 18),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.4))
                              ],
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Donation target :",
                                  style:
                                      body6TextStyle(weight: FontWeight.bold),
                                ),
                                SizedBox(height: 8),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: LinearProgressIndicator(
                                    minHeight: 5,
                                    value: data.progress / data.target,
                                    color: ColorConstants.primary[600],
                                    backgroundColor: ColorConstants.slate[200],
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "${data.progress} boxes food of ${data.target} boxes",
                                  style: body6TextStyle(
                                    color: ColorConstants.slate[500],
                                    weight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Campaign Information",
                            style: h5TextStyle(
                              weight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.calendar_month_outlined,
                                size: 14,
                              ),
                              SizedBox(width: 8),
                              Flexible(
                                child: Text(
                                  "Until ${data.end_date == null ? "" : formatDateToString(data.end_date!)}",
                                  style: body6TextStyle(
                                    color: ColorConstants.slate[500],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 14,
                              ),
                              SizedBox(width: 8),
                              Flexible(
                                child: Text(
                                  "${data.area} & Nearby",
                                  style: body6TextStyle(
                                    color: ColorConstants.slate[500],
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/piring.svg",
                                width: 14,
                              ),
                              SizedBox(width: 8),
                              Flexible(
                                child: Builder(
                                  builder: (e) {
                                    List<String> items = data.type ?? [];

                                    String result;

                                    if (items.isEmpty) {
                                      result = "-";
                                    } else if (items.length == 1) {
                                      result = items.first;
                                    } else {
                                      result =
                                          "${items.sublist(0, items.length - 1).join(", ")}, and ${items.last}";
                                    }

                                    return Text(
                                      "Accept $result",
                                      style: body6TextStyle(
                                        color: ColorConstants.slate[500],
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Description",
                            style: h5TextStyle(
                              weight: FontWeight.w800,
                              color: ColorConstants.slate[900],
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            data.description,
                            style: body6TextStyle(
                              color: ColorConstants.slate[600],
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ]),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: 100.w,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (builder) {
                            return DonateDialog();
                          },
                        );
                      },
                      child: Text(
                        "Donate!",
                        style: h4TextStyle(
                          color: Colors.white,
                          weight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
