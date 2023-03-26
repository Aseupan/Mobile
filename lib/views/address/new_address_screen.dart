import 'package:flutter/material.dart';
import 'package:mobile/widgets/custom_appbar.dart';
import 'package:mobile/widgets/custom_dropdown.dart';
import 'package:mobile/widgets/custom_textfield.dart';
import 'package:mobile/widgets/text_styles.dart';

class NewAddressScreen extends StatefulWidget {
  const NewAddressScreen({super.key});

  @override
  State<NewAddressScreen> createState() => _NewAddressScreenState();
}

class _NewAddressScreenState extends State<NewAddressScreen> {
  Map<String, TextEditingController> formData = {
    'name': TextEditingController(),
    'phone': TextEditingController(),
    'address': TextEditingController(),
    'zipcode': TextEditingController(),
    'state': TextEditingController(),
    'district': TextEditingController(),
    'city': TextEditingController(),
    'addressDetail': TextEditingController(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Change Address"),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          child: Column(
            children: [
              CustomTextfield(
                label: "Name",
                controller: formData['name']!,
                placeholder: "Your Full Name",
                onChange: (e) {
                  print(formData['state']!.text);
                },
              ),
              SizedBox(height: 20),
              CustomTextfield(
                label: "Phone Number",
                controller: formData['phone']!,
                placeholder: "+62 000 123 4567",
              ),
              SizedBox(height: 20),
              CustomTextfield(
                label: "Address",
                controller: formData['address']!,
                placeholder: "Jl. Soekarno Hatta No. 123",
              ),
              SizedBox(height: 20),
              CustomDropdown(
                placeholder: "Choose State",
                controller: formData['state']!,
                menu: [
                  {
                    'value': 'Cilegon',
                    'text': 'Cilegon',
                  },
                ],
                label: 'State',
              ),
              SizedBox(height: 20),
              CustomDropdown(
                placeholder: "Choose City",
                controller: formData['city']!,
                menu: [
                  {
                    'value': 'Cilegon',
                    'text': 'Cilegon',
                  },
                ],
                label: 'City',
              ),
              SizedBox(height: 20),
              CustomDropdown(
                placeholder: "Choose District",
                controller: formData['district']!,
                menu: [
                  {
                    'value': 'Cilegon',
                    'text': 'Cilegon',
                  },
                ],
                label: 'State',
              ),
              SizedBox(height: 20),
              CustomTextfield(
                label: "Zip Code",
                controller: formData['zipcode']!,
                placeholder: "Input your zip code",
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
