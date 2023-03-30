import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:mobile/controller/campaign/campaign_controller.dart';
import 'package:mobile/widgets/control_counter.dart';
import 'package:mobile/widgets/custom_appbar.dart';
import 'package:mobile/widgets/custom_textfield.dart';

class CreateCampaignScreen extends StatefulWidget {
  const CreateCampaignScreen({super.key});

  @override
  State<CreateCampaignScreen> createState() => _CreateCampaignScreenState();
}

class _CreateCampaignScreenState extends State<CreateCampaignScreen> {
  var controller = CampaignController.i;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Create Campaign"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              SizedBox(height: 5),
              // CustomTextfield(
              //   label: "Campaign Name",
              //   // controller: controller.createCampaign.value.name.value,
              //   placeholder: "ex : Helping Homeless Get Their Breakfast",
              // ),
              // SizedBox(height: 13),
              // CustomTextfield(
              //   label: "Campaign Description",
              //   controller: controller.createCampaign['description'],
              //   placeholder: "Enter a description...",
              //   maxLines: 6,
              // ),
              // Obx(
              //   () => ControlCounter(
              //     label: "Campaign Target",
              //     value:
              //         int.parse(controller.createCampaign.value['target'].text),
              //     onChange: (e) {
              //       controller.createCampaign.value['target'].text = "$e";
              //     },
              //     unit: "asd",
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
