import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/controller/campaign/campaign_controller.dart';
import 'package:mobile/controller/campaign/catering_controller.dart';
import 'package:mobile/routes/app_routes.dart';
import 'package:mobile/services/api/get_api_service.dart';
import 'package:mobile/widgets/custom_appbar.dart';
import 'package:mobile/widgets/custom_textfield.dart';
import 'package:mobile/widgets/text_styles.dart';
import 'package:mobile/utils/copy_map.dart';
import 'package:mobile/views/campaign/catering/widgets/catering_card.dart';

class FormCateringScreen extends StatefulWidget {
  const FormCateringScreen({super.key});

  @override
  State<FormCateringScreen> createState() => _FormCateringScreenState();
}

class _FormCateringScreenState extends State<FormCateringScreen> {
  String id = Get.parameters['id']!;
  CampaignController controller = CampaignController.i;
  late Map<String, dynamic>? data = controller.cateringForm[id];
  CateringController cateringController = CateringController.i;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        controller.cateringForm[id] =
            copyMap<dynamic>(controller.baseCateringForm);

        GetApiService.getAllCetering();
      },
    );
  }

  int cateringId = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        "Catering Details",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'New Catering Address',
                style: body5TextStyle(
                  weight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              CustomTextfield(
                label: "Catering Name",
                controller:
                    controller.cateringForm['name'] ?? TextEditingController(),
                placeholder: "Input catering name",
              ),
              SizedBox(height: 12),
              CustomTextfield(
                label: "Phone Number",
                controller:
                    controller.cateringForm['phone'] ?? TextEditingController(),
                placeholder: "ex: +62 000 123 4567",
              ),
              SizedBox(height: 12),
              CustomTextfield(
                label: "Address",
                controller: controller.cateringForm['address'] ??
                    TextEditingController(),
                placeholder: "ex: Jl. Soekarno Hatta No. 123",
              ),
              SizedBox(height: 12),
              CustomTextfield(
                label: "Address Detail (Optionak)",
                controller: controller.cateringForm['addressDetail'] ??
                    TextEditingController(),
                placeholder: "Unit, Building, Landmark",
                maxLines: 5,
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Obx(
                    () => Checkbox(
                      value: controller.cateringForm['issave'] ?? false,
                      onChanged: (e) {
                        controller.cateringForm['issave'] = e;
                      },
                      visualDensity: VisualDensity.compact,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                  Text(
                    'Save to My Address',
                    style: body5TextStyle(
                      weight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Text(
                'Recently Added',
                style: body5TextStyle(
                  weight: FontWeight.bold,
                ),
              ),
              Obx(
                () => Wrap(
                  runSpacing: 20,
                  children: cateringController.caterings
                      .map(
                        (e) => CateringCard(
                          data: e,
                          catering: cateringController.cateringId.value,
                          onChanged: <int>(e) {
                            cateringController.cateringId.value = e!;
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
              SizedBox(height: 20),
              Obx(
                () => ElevatedButton(
                  onPressed: cateringController.cateringId.value != -999
                      ? () {
                          Get.toNamed(RoutePage.cateringPickup,
                              parameters: {'id': id});
                        }
                      : null,
                  child: Text('Continue To Shiping'),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
