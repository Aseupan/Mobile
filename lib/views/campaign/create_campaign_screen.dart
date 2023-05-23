import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:mobile/controller/campaign/campaign_controller.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/views/campaign/widgets/insert_image.dart';
import 'package:mobile/utils/input_validator.dart';
import 'package:mobile/widgets/control_counter.dart';
import 'package:mobile/widgets/custom_appbar.dart';
import 'package:mobile/widgets/custom_textfield.dart';
import 'package:mobile/widgets/text_styles.dart';
import 'package:mobile/widgets/custom_checkbox.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class CreateCampaignScreen extends StatefulWidget {
  const CreateCampaignScreen({super.key});

  @override
  State<CreateCampaignScreen> createState() => _CreateCampaignScreenState();
}

class _CreateCampaignScreenState extends State<CreateCampaignScreen> {
  var controller = CampaignController.i;
  List<String> types = <String>[];
  DateTime initialDate = DateTime.now();
  TimeOfDay initialTime = TimeOfDay.now();
  var startTime = TextEditingController();
  var endTime = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void handleCheckbox(bool? e, String text) {
    setState(() {
      if (e!) {
        types.add(text);
      } else {
        types.remove(text);
      }
    });
    controller.data['type'] = types;
  }

  TextStyle defaultStyle = body5TextStyle(weight: FontWeight.w500);

  Future<void> selectTime(
      BuildContext context, TextEditingController controller) async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: initialTime);

    if (picked != null) {
      controller.text = "${picked.hour}:${picked.minute}";
      setState(() {});
    }
  }

  Future<void> _selectDate(
      BuildContext context, TextEditingController dateController) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != initialDate) {
      setState(() {
        initialDate = picked;
        dateController.text = DateFormat.yMd().format(initialDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Create Campaign"),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 5),
                CustomTextfield(
                  label: "Campaign Name",
                  controller: controller.data['name'],
                  placeholder: "ex : Helping Homeless Get Their Breakfast",
                  validator: (e) =>
                      inputValidator(e, "Campaign Name cannot be empty"),
                ),
                SizedBox(height: 13),
                CustomTextfield(
                  label: "Campaign Description",
                  controller: controller.data['description'],
                  placeholder: "Enter a description...",
                  maxLines: 6,
                  validator: (e) =>
                      inputValidator(e, "Campaign Description cannot be empty"),
                ),
                SizedBox(height: 13),
                Obx(
                  () => ControlCounter(
                    label: "Campaign Target",
                    value: controller.data['target'],
                    onChange: (e) {
                      controller.data['target'] = e;
                    },
                    unit: "box",
                  ),
                ),
                SizedBox(height: 13),
                CustomTextfield(
                  label: "Campaign Area",
                  controller: controller.data['area'],
                  placeholder: "ex : Jl. Soekarno Hatta",
                  readOnly: true,
                  validator: (e) =>
                      inputValidator(e, "Campaign area cannot be empty"),
                  action: InkWell(
                    onTap: () async {
                      if (await controller.checkPermission()) {
                        controller.pickLocation();
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: ColorConstants.slate[400]!,
                          ),
                        ),
                      ),
                      child: Text(
                        'Pick Location',
                        style: body6TextStyle(
                          weight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Only user in this area and nearest can donate',
                  style: body5TextStyle(
                    color: ColorConstants.slate[400],
                    weight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 13),
                Text(
                  'Preferred Food Type',
                  style: defaultStyle,
                ),
                CustomCheckbox(
                  label: "Fruit & Vegetables",
                  onChanged: handleCheckbox,
                ),
                CustomCheckbox(
                  label: "Starchy Foods",
                  onChanged: handleCheckbox,
                ),
                CustomCheckbox(
                  label: "Fast Food",
                  onChanged: handleCheckbox,
                ),
                CustomCheckbox(
                  label: "Dairy",
                  onChanged: handleCheckbox,
                ),
                CustomCheckbox(
                  label: "Protein",
                  onChanged: handleCheckbox,
                ),
                CustomCheckbox(
                  label: "Fat",
                  onChanged: handleCheckbox,
                ),
                CustomCheckbox(
                  label: "Snack",
                  onChanged: handleCheckbox,
                ),
                CustomCheckbox(
                  label: "Hydration",
                  onChanged: handleCheckbox,
                ),
                SizedBox(height: 13),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Start Date',
                          style: defaultStyle,
                        ),
                        SizedBox(height: 6),
                        TextFormField(
                          style:
                              body5TextStyle(color: ColorConstants.slate[900]),
                          controller: controller.data['startdate'],
                          decoration: InputDecoration(
                            hintText: "Choose",
                            constraints: BoxConstraints(maxWidth: 55.w),
                          ),
                          readOnly: true,
                          onTap: () async {
                            await _selectDate(
                                context, controller.data['startdate']);
                          },
                          validator: (e) =>
                              inputValidator(e, "please input start date"),
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Time',
                            style: defaultStyle,
                          ),
                          SizedBox(height: 6),
                          TextFormField(
                            style: body5TextStyle(
                                color: ColorConstants.slate[900]),
                            controller: startTime,
                            decoration: InputDecoration(
                              constraints: BoxConstraints(maxWidth: 100.w),
                              hintText: "Select",
                            ),
                            readOnly: true,
                            onTap: () async {
                              await selectTime(context, startTime);
                            },
                            validator: (e) => inputValidator(e, "please input"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 13),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'End Date',
                          style: defaultStyle,
                        ),
                        SizedBox(height: 6),
                        TextFormField(
                          style:
                              body5TextStyle(color: ColorConstants.slate[900]),
                          controller: controller.data['enddate'],
                          decoration: InputDecoration(
                            hintText: "Choose",
                            constraints: BoxConstraints(maxWidth: 55.w),
                          ),
                          readOnly: true,
                          onTap: () async {
                            await _selectDate(
                                context, controller.data['enddate']);
                          },
                          validator: (e) =>
                              inputValidator(e, "please input start date"),
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Time',
                            style: defaultStyle,
                          ),
                          SizedBox(height: 6),
                          TextFormField(
                            style: body5TextStyle(
                                color: ColorConstants.slate[900]),
                            controller: endTime,
                            decoration: InputDecoration(
                              constraints: BoxConstraints(maxWidth: 100.w),
                              hintText: "Select",
                            ),
                            readOnly: true,
                            validator: (e) => inputValidator(e, "please input"),
                            onTap: () async {
                              await selectTime(context, endTime);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 13),
                InsertImage(),
                SizedBox(height: 13),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 17, horizontal: 19),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Potential Earn Points',
                        style: body5TextStyle(
                          weight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/logo/logo-blue.svg",
                            width: 17,
                          ),
                          SizedBox(width: 1),
                          Text(
                            '300',
                            style: body6TextStyle(
                              color: ColorConstants.slate[400],
                              weight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 13),
                Row(
                  children: [
                    Obx(() => Switch(
                          value: controller.data['urgent'] == 1 ? true : false,
                          onChanged: (e) {
                            controller.data['urgent'] = (e == true) ? 1 : 0;
                          },
                        )),
                    SizedBox(width: 3),
                    Text(
                      'This campaign urgently needed',
                      style: body5TextStyle(
                        color: ColorConstants.slate[500],
                        weight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      controller.createCampaign(context);
                    }
                  },
                  child: Text('Create My Campaign!'),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
