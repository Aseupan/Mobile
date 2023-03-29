import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/controller/chips/chips_controller.dart';
import 'package:mobile/models/chips/chips_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/services/api/post_api_service.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/widgets/text_styles.dart';
import 'package:mobile/utils/format_rupiah.dart';

class ChipsCard extends StatefulWidget {
  ChipsModel data;
  ChipsCard({super.key, required this.data});

  @override
  State<ChipsCard> createState() => _ChipsCardState();
}

class _ChipsCardState extends State<ChipsCard> {
  ChipsController controller = ChipsController.i;
  bool isAdd = false;

  Widget IconAdd() {
    return Obx(() =>
        controller.carts.any((cart) => cart.credit_store_id == widget.data.id)
            ? Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorConstants.flowerBlue[600],
                ),
                child: Icon(
                  Icons.check,
                  size: 14,
                  color: Colors.white,
                ),
              )
            : GestureDetector(
                onTap: () {
                  PostApiService.addToCart(widget.data.id);
                },
                child: Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorConstants.slate[100],
                  ),
                  child: Icon(
                    Icons.add,
                    color: ColorConstants.slate[400],
                    size: 14,
                  ),
                ),
              ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.05),
            offset: Offset(0, 4),
            blurRadius: 40,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                "assets/logo/logo-blue.svg",
                height: 20,
                width: 25,
              ),
              SizedBox(width: 7),
              Text(
                "${widget.data.points} Chips",
                style: body6TextStyle(
                  weight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: ColorConstants.slate[50],
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/coin.svg",
                      width: 15,
                      height: 15,
                    ),
                    SizedBox(width: 5),
                    Text(
                      formatToRupiah(widget.data.price),
                      style: body6TextStyle(weight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 12),
              IconAdd(),
            ],
          )
        ],
      ),
    );
  }
}
