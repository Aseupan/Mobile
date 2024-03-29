import 'package:flutter/material.dart';
import 'package:mobile/services/api/post_api_service.dart';
import 'package:mobile/utils/input_validator.dart';
import 'package:mobile/widgets/custom_appbar.dart';
import 'package:mobile/widgets/custom_textfield.dart';
import 'package:mobile/widgets/text_styles.dart';

class NewAddressScreen extends StatefulWidget {
  const NewAddressScreen({super.key});

  @override
  State<NewAddressScreen> createState() => _NewAddressScreenState();
}

class _NewAddressScreenState extends State<NewAddressScreen> {
  bool isPrimary = false;
  final _formKey = GlobalKey<FormState>();

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

  void addAddress() {
    var copyFormData = formData.map((key, value) => MapEntry(key, value.text));
    PostApiService.addNewAddress(copyFormData, isPrimary: isPrimary);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Create New Address"),
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
                  placeholder: "Input your zip code",
                  keyboardType: TextInputType.number,
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
                      value: isPrimary,
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
                      addAddress();
                    }
                  },
                  child: Text(
                    'Create New Address',
                    style: h4TextStyle(
                        weight: FontWeight.w600, color: Colors.white),
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
