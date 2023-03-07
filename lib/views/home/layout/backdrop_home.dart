import 'package:flutter/material.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/widgets/text_styles.dart';

class BackdropHome extends StatefulWidget {
  const BackdropHome({super.key});

  @override
  State<BackdropHome> createState() => _BackdropHomeState();
}

class _BackdropHomeState extends State<BackdropHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: ColorConstants.gradient[3],
      ),
      padding: EdgeInsets.only(
        top: 55,
        bottom: 70,
        left: 30,
        right: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hello,",
            style: h4TextStyle(color: ColorConstants.slate[25]),
          ),
          Text(
            "Jennifer",
            style: h2TextStyle(
              color: ColorConstants.slate[25],
              weight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 13),
          Container(
            decoration: BoxDecoration(
                color: ColorConstants.primary[600],
                borderRadius: BorderRadius.all(
                  Radius.circular(7),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.2),
                    blurRadius: 40,
                    spreadRadius: 0,
                    offset: Offset(0, 0),
                  ),
                ]),
            child: Stack(
              children: [
                Positioned(
                  top: -20,
                  left: -40,
                  child: Image(
                    image: AssetImage('assets/images/home_card.png'),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                      child: Column(
                        children: [
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "My Chips",
                                style: body5TextStyle(
                                  weight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                              Icon(
                                Icons.chevron_right,
                                color: Colors.white,
                                size: 16,
                              ),
                              SizedBox(width: 18)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.check_circle_rounded,
                                color: Colors.white,
                                size: 18,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "500",
                                style: h1TextStyle(
                                  weight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 18)
                            ],
                          ),
                          SizedBox(height: 10),
                          LinearProgressIndicator(
                            color: ColorConstants.secondary[600],
                            backgroundColor: ColorConstants.slate[800],
                            minHeight: 5,
                            value: 0.6,
                          )
                        ],
                      ),
                    ),
                    Divider(
                      color: ColorConstants.flowerBlue[400],
                      thickness: 0.5,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 18,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.info_outline_rounded,
                            size: 12,
                            color: Colors.white,
                          ),
                          SizedBox(width: 5),
                          Flexible(
                            child: Text(
                              "Collect 150 chips before July 31st to get special treasure!",
                              style: TextStyle(
                                fontSize: 10,
                                color: ColorConstants.slate[25],
                                fontWeight: FontWeight.w600,
                                height: 1.1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
