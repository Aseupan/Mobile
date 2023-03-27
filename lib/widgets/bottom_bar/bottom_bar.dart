import 'package:flutter/material.dart';
import 'package:mobile/controller/global/global_controller.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/widgets/bottom_bar/items.dart';

class CustomBottomAppbar extends StatelessWidget {
  int index;
  GlobalController controller = GlobalController.i;

  CustomBottomAppbar({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    controller.stateBar.value = index;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.05),
            offset: Offset(0, -2),
            blurRadius: 5,
          ),
        ],
      ),
      height: 73,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 15),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BottomBarItem(
                  index: 1,
                  current: index,
                ),
                BottomBarItem(
                  index: 2,
                  current: index,
                ),
                BottomBarItem(
                  index: 3,
                  current: index,
                ),
                BottomBarItem(
                  index: 4,
                  current: index,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
