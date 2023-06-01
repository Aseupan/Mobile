import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mobile/controller/home/home_controller.dart';
import 'package:mobile/models/home/information_card.dart';
import 'package:mobile/views/home/components/card_info.dart';
import 'package:mobile/widgets/text_styles.dart';

class HomeInfoLayout extends StatelessWidget {
  HomeInfoLayout({super.key});

  final controller = HomeController.i;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Info",
          style: h5TextStyle(weight: FontWeight.w800),
        ),
        SizedBox(height: 15),
        Wrap(
          runSpacing: 20,
          children: [
            CardInfo(
              data: InformationCard(
                CreatedAt: "2023-05-23T16:31:29.593108Z",
                body:
                    "Eating a banana every day is not only a delicious habit but also a healthy choice. Bananas are a nutritional powerhouse, packed with essential vitamins, minerals, and fiber. They are a rich source of potassium, which supports heart health and aids in maintaining proper blood pressure levels. Moreover, bananas provide a natural energy boost, making them an excellent snack choice for active individuals or those needing a mid-day pick-me-up. The fiber content in bananas promotes healthy digestion and helps to regulate bowel movements. Additionally, these versatile fruits contain antioxidants that contribute to a strengthened immune system and promote overall well-being. So, grab a banana today and enjoy its delightful taste while reaping the numerous health benefits it has to offer",
                id: 1,
                thumbnail:
                    "https://api-ruang-bersama.mfadlihs.com/public/images/pisang.jpg",
                title: "Eat Banana everyday",
                type: "Foods & Healty",
              ),
            )
          ],
        ),

        // Obx(() {
        //   return Wrap(
        //     runSpacing: 20,
        //     children: controller.informations
        //         .map((element) => CardInfo(
        //               data: element,
        //             ))
        //         .toList(),
        //   );
        // })
      ],
    );
  }
}
