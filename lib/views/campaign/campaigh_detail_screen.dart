import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/widgets/custom_appbar.dart';
import 'package:mobile/widgets/text_styles.dart';
import 'package:sizer/sizer.dart';

class CampaignDetailScreen extends StatefulWidget {
  const CampaignDetailScreen({super.key});

  @override
  State<CampaignDetailScreen> createState() => _CampaignDetailScreenState();
}

class _CampaignDetailScreenState extends State<CampaignDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.slate[25],
      appBar: CustomAppBar("Campaign Details"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              items: [1, 2, 3, 4, 5, 6]
                  .map(
                    (e) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 7),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Image(
                          image: AssetImage('assets/images/dummy_campaign.jpg'),
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
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
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
                          style: body6TextStyle(weight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: LinearProgressIndicator(
                            minHeight: 5,
                            value: 0.7,
                            color: ColorConstants.primary[600],
                            backgroundColor: ColorConstants.slate[200],
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "90 boxes food of 100 boxes",
                          style: body6TextStyle(
                            color: ColorConstants.slate[500],
                            weight: FontWeight.w400,
                          ),
                        )
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
                        size: 12,
                      ),
                      SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          "Until 10 March 2023",
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
                        Icons.calendar_month_outlined,
                        size: 12,
                      ),
                      SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          "Jl. Soekarno Hatta & Nearby",
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
                      Icon(
                        Icons.calendar_month_outlined,
                        size: 12,
                      ),
                      SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          "Accept Fast Food, Dairy, Protein, and Hydrate",
                          style: body6TextStyle(
                            color: ColorConstants.slate[500],
                          ),
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
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed auctor quis sapien eu rutrum. Fusce vitae enim eget ipsum eleifend feugiat eu vel neque. Praesent sit amet justo magna. Sed aliquam nisl ut diam eleifend, id vehicula dolor vehicula. Praesent at ante ut sapien placerat dapibus in ut magna. Sed lacinia turpis vel neque efficitur mollis. Donec eget interdum ipsum. Vivamus euismod lorem sed consequat consectetur. Sed pretium nunc sit amet ante suscipit fringilla. Aliquam erat volutpat. Sed non arcu velit. Vivamus quis lectus eget nisi efficitur aliquam. Nullam sodales turpis id odio vulputate varius. Sed nec felis eu arcu convallis suscipit.",
                    style: body6TextStyle(
                      color: ColorConstants.slate[600],
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 50),
                  SizedBox(
                    width: 100.w,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(),
                      onPressed: () {},
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
