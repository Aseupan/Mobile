import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/controller/profile/edit_profile_controller.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/widgets/custom_appbar.dart';
import 'package:mobile/widgets/custom_textfield.dart';
import 'package:mobile/widgets/text_styles.dart';
import 'package:sizer/sizer.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  EditProfileController controller = EditProfileController.i;
  final _formKey = GlobalKey<FormState>();

  Future<bool> onWillPop() {
    if (controller.isEdited.value) {
      return Future.value(true);
    }
    return Future.value(false);
  }

  Widget dialog(BuildContext context) {
    return Dialog(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Your Changes Not Saved',
              style: h4TextStyle(
                weight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Are you sure to leave this page before your changes saved?',
              style: body5TextStyle(color: ColorConstants.slate[400]),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'I\'ll Stay here',
                    style: body6TextStyle(
                      weight: FontWeight.w500,
                      color: ColorConstants.slate[500],
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  ),
                  onPressed: () {
                    Get.back();
                    Get.back();
                  },
                  child: Text(
                    'I\'m Sure',
                    style: body6TextStyle(
                      weight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  bool _isEdited = false;
  @override
  Widget build(BuildContext context) {
    print(_isEdited);
    return WillPopScope(
      onWillPop: () {
        if (!_isEdited) {
          return Future.value(true);
        }

        showDialog(
          context: context,
          builder: (BuildContext context) => dialog(context),
        );
        return Future.value(false);
      },
      child: Scaffold(
        appBar: CustomAppBar(
          "Edit My Profile",
          canBack: !_isEdited,
          feedback: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => dialog(context),
            );
          },
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 20),
                  Center(
                    child: Image.asset(
                      "assets/images/dummy_profile.png",
                      width: 115,
                      height: 115,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 12),
                  InkWell(
                    child: Text(
                      'Set photo profile',
                      style: body6TextStyle(color: ColorConstants.slate[400]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 25),
                  SizedBox(
                    height: 400,
                    child: Column(
                      children: [
                        CustomTextfield(
                          label: "Name",
                          controller: controller.data['name']!,
                          placeholder: "",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                          onChange: (_) {
                            setState(() {
                              _isEdited = true;
                            });
                          },
                        ),
                        SizedBox(height: 20),
                        CustomTextfield(
                          label: "Emaii",
                          controller: controller.data['email']!,
                          placeholder: "",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your Email';
                            }

                            if (!EmailValidator.validate(value)) {
                              return "Email is not valid";
                            }

                            return null;
                          },
                          onChange: (_) {
                            setState(() {
                              _isEdited = true;
                            });
                          },
                        ),
                        SizedBox(height: 20),
                        CustomTextfield(
                          keyboardType: TextInputType.number,
                          label: "Phone Number",
                          controller: controller.data['phone']!,
                          placeholder: "Enter your phone number",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Phone Number is not valid';
                            }

                            return null;
                          },
                          onChange: (_) {
                            setState(() {
                              _isEdited = true;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        controller.editProfile();
                      }
                    },
                    child: Text(
                      'Save Changes',
                      style: h4TextStyle(
                        color: Colors.white,
                        weight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
