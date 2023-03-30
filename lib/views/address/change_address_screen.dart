import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/controller/global/global_controller.dart';
import 'package:mobile/services/api/post_api_service.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/utils/input_validator.dart';
import 'package:mobile/widgets/custom_appbar.dart';
import 'package:mobile/widgets/custom_textfield.dart';
import 'package:mobile/widgets/text_styles.dart';

class ChangeAddressScreen extends StatefulWidget {
  const ChangeAddressScreen({super.key});

  @override
  State<ChangeAddressScreen> createState() => _ChangeAddressScreenState();
}

class _ChangeAddressScreenState extends State<ChangeAddressScreen> {
  final _formKey = GlobalKey<FormState>();
  GlobalController controller = GlobalController.i;
  final id = Get.parameters['id'];

  bool initialPrimary = false;
  bool isPrimary = false;
  Map<String, TextEditingController> formData = {
    'name': TextEditingController(),
    'phone': TextEditingController(),
    'address': TextEditingController(),
    'zip_code': TextEditingController(),
    'state': TextEditingController(),
    'disctrict': TextEditingController(),
    'city': TextEditingController(),
    'detailed_address': TextEditingController(),
  };

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var currentAddress =
          controller.address.firstWhere((e) => e.index == num.parse(id!));

      setState(() {
        formData['name']!.text = currentAddress.name;
        formData['phone']!.text = currentAddress.phone;
        formData['address']!.text = currentAddress.address;
        formData['zip_code']!.text = currentAddress.zip_code;
        formData['state']!.text = currentAddress.state;
        formData['city']!.text = currentAddress.city;
        formData['detailed_address']!.text = currentAddress.detailed_address;
        formData['disctrict']!.text = currentAddress.disctrict;
        isPrimary = currentAddress.primary_address;
        initialPrimary = currentAddress.primary_address;
      });
    });
  }

  bool currentPrimary() {
    return initialPrimary ? false : isPrimary;
  }

  void changeAddress() {
    var copyFormData = formData.map((key, value) => MapEntry(key, value.text));
    PostApiService.changeAddress(
      copyFormData,
      id!,
      isPrimary: currentPrimary(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar("Change Address"),

      appBar: CustomAppBar(
        "Change Address",
        actions: [
          !initialPrimary
              ? InkWell(
                  onTap: () {
                    PostApiService.deleteAddress(id!);
                  },
                  child: Center(
                    child: Text(
                      "Delete",
                      style: body6TextStyle(
                        color: ColorConstants.error,
                        weight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              : SizedBox(),
          SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomTextfield(
                  label: "Name",
                  controller: formData['name']!,
                  placeholder: "Your Full Name",
                  validator: (e) {
                    return inputValidator(e, "Please enter your name");
                  },
                ),
                SizedBox(height: 20),
                CustomTextfield(
                  label: "Phone Number",
                  controller: formData['phone']!,
                  placeholder: "+62 000 123 4567",
                  keyboardType: TextInputType.number,
                  validator: (e) {
                    return inputValidator(e, "Please enter your phone ");
                  },
                ),
                SizedBox(height: 20),
                CustomTextfield(
                  label: "Address",
                  controller: formData['address']!,
                  placeholder: "Jl. Soekarno Hatta No. 123",
                  validator: (e) =>
                      inputValidator(e, "Please enter your address"),
                ),
                SizedBox(height: 20),
                CustomTextfield(
                  label: "State",
                  controller: formData['state']!,
                  placeholder: "Choose State",
                  validator: (e) =>
                      inputValidator(e, "Please enter your state"),
                ),
                SizedBox(height: 20),
                CustomTextfield(
                  label: "City",
                  controller: formData['city']!,
                  placeholder: "Choose City",
                  validator: (e) => inputValidator(e, "Please enter your city"),
                ),
                SizedBox(height: 20),
                CustomTextfield(
                  label: "District",
                  controller: formData['disctrict']!,
                  placeholder: "Choose District",
                  validator: (e) =>
                      inputValidator(e, "Please enter your district"),
                ),
                SizedBox(height: 20),
                CustomTextfield(
                  label: "Zip Code",
                  controller: formData['zip_code']!,
                  keyboardType: TextInputType.number,
                  placeholder: "Input your zip code",
                  validator: (e) =>
                      inputValidator(e, "Please enter your Zip Code Number"),
                ),
                SizedBox(height: 20),
                CustomTextfield(
                  label: "Address Detail (Optional)",
                  controller: formData['detailed_address']!,
                  placeholder: "Unit, Building, Landmark",
                  maxLines: 5,
                ),
                Row(
                  children: [
                    Switch(
                      value: initialPrimary ? true : isPrimary,
                      onChanged: (current) {
                        setState(() {
                          isPrimary = current;
                        });
                      },
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Set as Primary Address',
                      style: body5TextStyle(
                        weight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.only(top: 12, bottom: 12),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      changeAddress();
                    }
                  },
                  child: Text(
                    'Change Address',
                    style: h4TextStyle(
                      weight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
