import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/models/chips/cart_model.dart';
import 'package:mobile/services/api/post_api_service.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/widgets/control_counter.dart';
import 'package:mobile/widgets/text_styles.dart';

class EditCartCard extends StatelessWidget {
  CartModel data;
  EditCartCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(17),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.05),
            offset: Offset(0, 4),
            blurRadius: 40,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                "assets/logo/logo-blue.svg",
                width: 22,
                height: 18,
              ),
              SizedBox(width: 5),
              Text(
                '${data.points} Chips',
                style: body4TextStyle(
                  weight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(
                color: ColorConstants.slate[300]!,
              ),
              borderRadius: BorderRadius.circular(7),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    PostApiService.addOneItemCart(data.credit_store_id);
                  },
                  child: SvgPicture.asset("assets/icons/plus.svg"),
                ),
                SizedBox(width: 16),
                Text(
                  '${data.quantity}',
                  style: body4TextStyle(
                    color: ColorConstants.slate[600],
                    weight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 16),
                GestureDetector(
                  onTap: data.quantity > 0
                      ? () {
                          PostApiService.removeOneItemCart(
                              data.credit_store_id);

                          // onChange(value - 1);
                        }
                      : null,
                  child: SvgPicture.asset("assets/icons/minus.svg"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
