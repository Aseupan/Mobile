import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/widgets/custom_appbar.dart';
import 'package:sizer/sizer.dart';

class CampaignProcedureScreen extends StatelessWidget {
  const CampaignProcedureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var id = Get.parameters['id']!;
    return Scaffold(
      appBar: CustomAppBar("Sharing Procedure"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Image.asset(
              "assets/images/sharing_procedure.png",
              width: 300,
              height: 200,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                children: [
                  Text(
                    'The food delivery procedure using food catering services is as follows:',
                    textAlign: TextAlign.justify,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('1.  '),
                      Expanded(
                        child: Text(
                          'Please make a booking contact with the catering service regarding the amount and type of food. ',
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('2.  '),
                      Expanded(
                        child: Text(
                          'Once the food is ready, use this application to collect the food from the catering service to be delivered to the campaign maker.',
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('3.  '),
                      Expanded(
                        child: Text(
                          'Monitor the food delivery from your application.',
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('4.  '),
                      Expanded(
                        child: Text(
                          'Once the order is completed, the chips will automatically be added to your account.',
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(100.w, 40),
                    ),
                    onPressed: () {},
                    child: Text('I am Already Call the Catering'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
