import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/models/address/address_model.dart';
import 'package:mobile/routes/app_routes.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/widgets/text_styles.dart';

class AddressCard extends StatelessWidget {
  final bool isPrimary;
  final AddressModel data;

  AddressCard({super.key, required this.isPrimary, required this.data});

  final Widget primaryWidget = Container(
    decoration: BoxDecoration(
      color: ColorConstants.flowerBlue[600],
      borderRadius: BorderRadius.circular(2),
    ),
    padding: EdgeInsets.symmetric(
      vertical: 1,
      horizontal: 5,
    ),
    child: Text(
      'Primary',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w800,
        fontSize: 9.5,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(RoutePage.editAddress(data.index));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 130,
                  child: Text(
                    data.name,
                    overflow: TextOverflow.ellipsis,
                    style: body5TextStyle(weight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: 1,
                  height: 13,
                  color: ColorConstants.slate[400],
                ),
                Expanded(
                  child: Text(
                    data.phone,
                    style: body6TextStyle(
                      color: ColorConstants.slate[400],
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
            SizedBox(height: 14),
            Text(
              "${data.address}\n${data.state}, ${data.city}, ${data.disctrict}, ${data.zip_code}",
              style: body6TextStyle(weight: FontWeight.w500),
            ),
            SizedBox(height: 13),
            data.primary_address ? primaryWidget : Container(),
          ],
        ),
      ),
    );
  }
}
