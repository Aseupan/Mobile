import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mobile/controller/global/global_controller.dart';
import 'package:mobile/services/api/get_api_service.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/views/rewards/layouts/more_chips.dart';
import 'package:mobile/views/rewards/layouts/redeem_chips.dart';
import 'package:mobile/views/rewards/layouts/reward_backdrop.dart';
import 'package:mobile/views/rewards/widgets/campaign_card.dart';
import 'package:mobile/widgets/bottom_bar/bottom_bar.dart';
import 'package:mobile/widgets/text_styles.dart';
import 'package:sizer/sizer.dart';

class RewardScreen extends StatefulWidget {
  const RewardScreen({super.key});

  @override
  State<RewardScreen> createState() => _RewardScreenState();
}

class _RewardScreenState extends State<RewardScreen> {
  var controller = GlobalController.i;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      GetApiService.getAllRedeemReward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          RewardBackdrop(),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: 100.w,
                  height: 32.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 22),
                  decoration: BoxDecoration(
                    color: ColorConstants.slate[25],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          'Earn Chips',
                          style: h5TextStyle(
                            weight: FontWeight.w800,
                          ),
                        ),
                      ),
                      SizedBox(height: 11),
                      CarouselSlider(
                        items: [1, 2, 3, 4, 5].map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return CampaignCard();
                            },
                          );
                        }).toList(),
                        options: CarouselOptions(
                          autoPlay: true,
                          enableInfiniteScroll: true,
                          viewportFraction: 0.9,
                          height: 190,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 20,
                        ),
                        child: Column(
                          children: [
                            MoreChips(),
                            SizedBox(height: 22),
                            RedeemChips(),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomAppbar(index: 2),
    );
  }
}
