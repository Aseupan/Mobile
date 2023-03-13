import 'package:flutter/widgets.dart';
import 'package:mobile/views/home/components/card_info.dart';
import 'package:mobile/widgets/text_styles.dart';

class HomeInfoLayout extends StatefulWidget {
  const HomeInfoLayout({super.key});

  @override
  State<HomeInfoLayout> createState() => _HomeInfoLayoutState();
}

class _HomeInfoLayoutState extends State<HomeInfoLayout> {
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
            CardInfo(),
            CardInfo(),
            CardInfo(),
            CardInfo(),
            CardInfo(),
          ],
        )

        // ListView(chi)
      ],
    );
  }
}
