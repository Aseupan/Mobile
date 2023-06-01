import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/controller/global/company_controller.dart';
import 'package:mobile/controller/global/global_controller.dart';
import 'package:mobile/routes/app_routes.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/views/profile/widgets/button_buy_chips.dart';
import 'package:mobile/views/profile/widgets/button_verified.dart';
import 'package:mobile/widgets/text_styles.dart';
import 'package:sizer/sizer.dart';

class ProfileHeader extends StatelessWidget {
  final GlobalController controller = GlobalController.i;
  final CompanyController company = CompanyController.i;

  ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    bool isCompany = controller.isAdmin.value;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Profile',
              style: h1TextStyle(
                weight: FontWeight.w800,
              ),
            ),
            InkWell(
              onTap: () {
                Get.toNamed(RoutePage.editProfile);
              },
              child: Container(
                padding: EdgeInsets.only(bottom: 2),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: ColorConstants.slate[400]!,
                      width: 1.0, // Underline thickness
                    ),
                  ),
                ),
                child: Text(
                  'Edit my profile',
                  style: body6TextStyle(color: ColorConstants.slate[400]),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        SizedBox(
          height: 68,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Obx(() {
                var profile = isCompany
                    ? company.profile.value.company_picture
                    : controller.profile.value.profile_picture;
                if (profile == "") {
                  return Image.asset(
                    "assets/images/dummy_profile.png",
                    width: 68,
                    height: 68,
                    fit: BoxFit.cover,
                  );
                } else {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.network(
                      profile,
                      width: 68,
                      height: 68,
                      fit: BoxFit.cover,
                    ),
                  );
                }
              }),
              SizedBox(width: 18),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 60.w,
                    child: Obx(
                      () => Text(
                        isCompany
                            ? company.profile.value.company_name
                            : controller.profile.value.name,
                        style: h4TextStyle(weight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Obx(() {
                    var data = isCompany
                        ? company.profile.value.company_phone
                        : controller.profile.value.phone;

                    return Text(data.isEmpty ? '-' : data);
                  }),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: ColorConstants.primary[600],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                        child: Text(
                          isCompany ? 'Big Party' : 'Regular Food Giver',
                          style: body6TextStyle(
                            weight: FontWeight.w700,
                            color: ColorConstants.slate[25],
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      isCompany
                          ? Container(
                              decoration: BoxDecoration(
                                color: company.profile.value.verified
                                    ? ColorConstants.success
                                    : ColorConstants.error,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 8),
                              child: Text(
                                company.profile.value.verified
                                    ? 'Verified'
                                    : 'Not Verified',
                                style: body6TextStyle(
                                  weight: FontWeight.w700,
                                  color: ColorConstants.slate[25],
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(height: 30),
        isCompany && !company.profile.value.verified
            ? ButtonVerified()
            : Container(),
        !isCompany ? ButtonBuyChips() : Container(),
      ],
    );
  }
}
