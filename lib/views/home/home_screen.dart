import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobile/controller/global/global_controller.dart';
import 'package:mobile/controller/home/home_controller.dart';
import 'package:mobile/routes/app_routes.dart';
import 'package:mobile/services/api/api_utils.dart';
import 'package:mobile/services/api/app_token.dart';
import 'package:mobile/services/api/get_api_service.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/views/home/layouts/home_backdrop.dart';
import 'package:mobile/views/home/layouts/home_info.dart';
import 'package:mobile/views/home/layouts/home_tips.dart';
import 'package:mobile/widgets/text_styles.dart';
import 'package:sizer/sizer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mobile/widgets/bottom_bar/bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var controller = GlobalController.i;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      GetApiService.getInformations();
      GetApiService.getuserProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackdropHome(),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: 100.w,
                  height: 40.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: ColorConstants.slate[25],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Center(
                        child: Container(
                          width: 35,
                          height: 4,
                          color: ColorConstants.slate[300],
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Popular Campaign",
                            style: h5TextStyle(weight: FontWeight.w800),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.toNamed(RoutePage.campaignList);
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            child: Text(
                              'See All',
                              style: body6TextStyle(
                                color: ColorConstants.flowerBlue[600],
                              ),
                            ),
                          ),
                        ],
                      ),
                      CarouselSlider(
                        items: [1, 2, 3, 4, 5].map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                  width: 100.w,
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Placeholder());
                            },
                          );
                        }).toList(),
                        options: CarouselOptions(
                          autoPlay: true,
                          enableInfiniteScroll: false,
                          padEnds: false,
                          height: 130,
                          viewportFraction: 0.9,
                        ),
                      ),
                      SizedBox(height: 20),
                      HomeTips(),
                      SizedBox(height: 25),
                      HomeInfoLayout(),
                      SizedBox(height: 35),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: DecoratedBox(
        decoration: BoxDecoration(
          gradient: ColorConstants.gradient['blue1'],
          borderRadius: BorderRadius.circular(12),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          ),
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Share Your Food!",
                style: h5TextStyle(
                  color: Colors.white,
                  weight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 5),
              SvgPicture.asset("assets/icons/food.svg")
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomAppbar(
        index: 1,
      ),
    );
  }
}
